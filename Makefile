COMPILER=java -jar compiler/compiler.jar
COMPILER_LIBRARY=compiler/library/closure-library-master/closure

COMPILER_ARGS=--js $(SOURCES) --externs $(EXTERN) --output_wrapper "(function() {%output%})();" --only_closure_dependencies --closure_entry_point branch_instance
COMPILER_MIN_ARGS=--compilation_level ADVANCED_OPTIMIZATIONS --define 'DEBUG=false'
COMPILER_DEBUG_ARGS=--formatting=print_input_delimiter --formatting=pretty_print --warning_level=VERBOSE --define 'DEBUG=true'

SOURCES=Web-SDK/src/0_config.js Web-SDK/src/0_storage.js Web-SDK/src/0_session.js Web-SDK/src/0_utils.js Web-SDK/src/0_queue.js Web-SDK/src/0_banner_utils.js Web-SDK/src/1_api.js Web-SDK/src/1_resources.js Web-SDK/src/1_banner_css.js Web-SDK/src/1_banner_html.js Web-SDK/src/2_banner.js Web-SDK/src/3_branch.js Web-SDK/src/4_initialization.js $(COMPILER_LIBRARY)/goog/**
EXTERN=Web-SDK/src/extern.js

.PHONY: clean

all: dist/build.min.js dist/build.js README.md
clean:
	rm -f dist/** docs/3_branch_web.md README.md

# Kinda gross, but will download closure compiler if you don't have it.
compiler/compiler.jar:
	mkdir -p compiler && \
		wget http://dl.google.com/closure-compiler/compiler-latest.zip && \
		unzip compiler-latest.zip -d compiler && \
		rm -f compiler-latest.zip

compiler/library/closure-library-master/closure/goog/**:
	mkdir -p compiler/library && \
		wget https://github.com/google/closure-library/archive/master.zip && \
		unzip master.zip -d compiler/library && \
		rm -f master.zip

dist/build.js: $(SOURCES) $(EXTERN) compiler/compiler.jar
	$(COMPILER) $(COMPILER_ARGS) $(COMPILER_DEBUG_ARGS) --define 'TITANIUM_BUILD=true' > dist/build.js

dist/build.min.js: $(SOURCES) $(EXTERN) compiler/compiler.jar
	$(COMPILER) $(COMPILER_ARGS) $(COMPILER_MIN_ARGS) --define 'TITANIUM_BUILD=true' > dist/build.min.js

# Documentation

docs/titanium/3_branch_titanium.md: $(SOURCES)
	perl -pe 's/\/\*\*\ =WEB/\/\*\*\*/gx' Web-SDK/src/3_branch.js > Web-SDK/src/3_branch_titanium.js
	perl -p -i -e 's/=CORDOVA//gx' Web-SDK/src/3_branch_titanium.js
	jsdox Web-SDK/src/3_branch_titanium.js --output docs
	rm Web-SDK/src/3_branch_titanium.js

README.md: docs/0_notice.md docs/titanium/1_intro.md docs/titanium/3_branch_titanium.md docs/4_footer.md
	perl Web-SDK/build_utils/toc_generator.pl Web-SDK/src/3_branch.js docs/titanium/2_table_of_contents.md TITANIUM
	cat docs/0_notice.md docs/titanium/1_intro.md docs/titanium/2_table_of_contents.md docs/titanium/3_branch_titanium.md docs/4_footer.md > README.md
	perl -p -i -e 's/# Global//' README.md
