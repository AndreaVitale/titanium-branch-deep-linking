/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2011-2013 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

/** This is generated, do not edit by hand. **/

#include <jni.h>

#include "Proxy.h"

		namespace titanium {
			namespace media {


class AudioPlayerProxy : public titanium::Proxy
{
public:
	explicit AudioPlayerProxy(jobject javaObject);

	static void bindProxy(v8::Handle<v8::Object> exports);
	static v8::Handle<v8::FunctionTemplate> getProxyTemplate();
	static void dispose();

	static v8::Persistent<v8::FunctionTemplate> proxyTemplate;
	static jclass javaClass;

private:
	// Methods -----------------------------------------------------------
	static v8::Handle<v8::Value> setTime(const v8::Arguments&);
	static v8::Handle<v8::Value> stop(const v8::Arguments&);
	static v8::Handle<v8::Value> isPaused(const v8::Arguments&);
	static v8::Handle<v8::Value> play(const v8::Arguments&);
	static v8::Handle<v8::Value> getDuration(const v8::Arguments&);
	static v8::Handle<v8::Value> isPlaying(const v8::Arguments&);
	static v8::Handle<v8::Value> destroy(const v8::Arguments&);
	static v8::Handle<v8::Value> pause(const v8::Arguments&);
	static v8::Handle<v8::Value> getAudioSessionId(const v8::Arguments&);
	static v8::Handle<v8::Value> getTime(const v8::Arguments&);
	static v8::Handle<v8::Value> getUrl(const v8::Arguments&);
	static v8::Handle<v8::Value> setUrl(const v8::Arguments&);
	static v8::Handle<v8::Value> start(const v8::Arguments&);
	static v8::Handle<v8::Value> release(const v8::Arguments&);

	// Dynamic property accessors ----------------------------------------
	static v8::Handle<v8::Value> getter_paused(v8::Local<v8::String> property, const v8::AccessorInfo& info);
	static v8::Handle<v8::Value> getter_playing(v8::Local<v8::String> property, const v8::AccessorInfo& info);
	static v8::Handle<v8::Value> getter_duration(v8::Local<v8::String> property, const v8::AccessorInfo& info);
	static v8::Handle<v8::Value> getter_time(v8::Local<v8::String> property, const v8::AccessorInfo& info);
	static void setter_time(v8::Local<v8::String> property, v8::Local<v8::Value> value, const v8::AccessorInfo& info);
	static v8::Handle<v8::Value> getter_url(v8::Local<v8::String> property, const v8::AccessorInfo& info);
	static void setter_url(v8::Local<v8::String> property, v8::Local<v8::Value> value, const v8::AccessorInfo& info);

};

			} // namespace media
		} // titanium
