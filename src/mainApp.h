#ifndef _TEST_APP
#define _TEST_APP


#include "ofMain.h"
#include "ofUtils.h"
#include "ofAddons.h"
#include "SpectrumDrawer.h"
#include "PlayerHead.h"
#include "ofxFileDialogOSX.h"
#include "ofSoundStream2.h"
#include "fft.h"

#define BUFFER_SIZE 8192

#define SAMPLE_RATE 44100
#define INITIAL_BUFFER_SIZE 512
#define BIT 256

//BIT defines the value, the many frequency, we will count 

class mainApp : public ofBaseApp{
	/*
	 enum
	 {
	 kParameter_Panel1,
	 kParameter_File
	 };
	 */
public:
	~mainApp();/* deconsructor is very useful */
	void setup();
	void update();
	void draw();
	
	void keyPressed  (int key);
	void keyReleased(int key);
	void mouseMoved(int x, int y );
	void mouseDragged(int x, int y, int button);
	void mousePressed(int x, int y, int button);
	void mouseReleased(int x, int y, int button);
	void windowResized(int w, int h);
	
	void audioRequested 	(float * input, int bufferSize, int nChannels); /* output method */
	void audioReceived 	(float * input, int bufferSize, int nChannels); /* input method */
	
	void loadMusic(string target);
	
	void openFile();
	void openMusicFile();
	string output;
	
	
	//music player
	ofSoundPlayer      demoSound;
	
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

#endif
