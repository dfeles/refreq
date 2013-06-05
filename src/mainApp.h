#pragma once


#include "ofMain.h"
#include "ofUtils.h"
#include "SpectrumDrawer.h"
#include "PlayerHead.h"
#include "ofSoundStream2.h"
#include <string.h>
#include "ofxNSWindowApp.h"
#include "fft.h"
#include "FFT2.h"

#define BUFFER_SIZE 8192

#define SAMPLE_RATE 44100
#define INITIAL_BUFFER_SIZE 512
#define BIT 512

#define PI 3.14159265
#define EPSILON 0.000001

//BIT defines the value, the many frequency, we will count 

class mainApp : public ofxNSWindowApp{
	/*
	 enum
	 {
	 kParameter_Panel1,
	 kParameter_File
	 };
	 */
public:
    ~mainApp();
    //basic functions
    
	void setup();
	void update();
	void draw();
    void close();
	
    //events
    
	void keyPressed  (int key);
	void keyReleased(int key);
	void mouseMoved(int x, int y );
	void mouseDragged(int x, int y, int button);
	void mousePressed(int x, int y, int button);
	void mouseReleased(int x, int y, int button);
	void windowResized(int w, int h);
    
    void dragEvent(ofDragInfo info);
    
    //init
    
	void audioRequested 	(float * input, int bufferSize, int nChannels); /* output method */
	void audioReceived 	(float * input, int bufferSize, int nChannels); /* input method */
	
	void loadMusic(string target);
	
	void openFile(string URL="");
	void openMusicFile();
    
    void stop();
    void play();
    
	void setSpectrumSpeed(float speed);
	void setMinHz(float speed);
	void setMaxHz(float speed);
    
	
    string output;
	
	
	//music player
	ofSoundPlayer      demoSound;
    ofPtr<ofFmodSoundPlayer> musicPlayer;
    ofFmodSoundPlayer player;
	
	bool            isPlaying;
	bool			imageLoaded;
	float            * demoBuffer;
	int               bufferSize; 
	double phase;
	
	//microphone
	fft		myfft;

	float * left;
	float * right;
	
	float magnitude[BUFFER_SIZE];
	float phase2[BUFFER_SIZE];
	float power[BUFFER_SIZE];
	
	//oscillator
	int		maxHertz;
	
	double sineBuffer[514];
	
	float remainder;
	float wave;
	
	//pointers
	bool recording;
	int vonal,rajz;
	
	/* stick you maximilian stuff below */
	
	double sample,outputs[2];
	
	float outp[INITIAL_BUFFER_SIZE];
	float amp[BIT];
	int hertzScale[BIT];
	float phases[BIT];
	
	
	double sinebuf(int n);
	
	float pixels[10000][10000];
	ofImage spectrumLoader;
	int w,h;
	
	SpectrumDrawer* spectrum;
	PlayerHead* playerHead;
};
