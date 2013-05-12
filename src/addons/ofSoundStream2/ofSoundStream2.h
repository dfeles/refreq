#ifndef _OF_SOUND_STREAM2
#define _OF_SOUND_STREAM2

#include "ofConstants.h"
#include "ofxNSWindowApp.h"
#include "ofEvents.h"
#include "ofMath.h"

void ofSoundStream2Setup(int nOutputChannels, int nInputChannels, ofxNSWindowApp * OFSA = NULL);
void ofSoundStream2Setup(int nOutputChannels, int nInputChannels, int sampleRate, int bufferSize, int nBuffers);
void ofSoundStream2Setup(int nOutputChannels, int nInputChannels, ofxNSWindowApp * OFSA, int sampleRate, int bufferSize, int nBuffers);
void ofSoundStream2Stop();
void ofSoundStream2Start();
void ofSoundStream2Close();
void ofSoundStream2ListDevices();

#endif
