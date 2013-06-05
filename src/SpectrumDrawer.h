/*
 *  spectrumDrawer.h
 *  emptyExample
 *
 *  Created by Feles Daniel on 11/12/10.
 *  Copyright 2010 Kitchen Budapest. All rights reserved.
 *
 */
#ifndef SPECTRUMDRAWER
#define SPECTRUMDRAWER

#define BIT 512

#include "SpectrumDrawer.h"
#include "ofMain.h"

class SpectrumDrawer{
public:
	SpectrumDrawer(int _minHz, int _maxHz);
	void update();
	void setPixel(int x,int y, float r, float g, float b);
	void setSize(int _w, int _h);
	
	void reloadTexture(int mode);
	void loadImageSpectrum(string target);
	void loadMusic(string target);
	void addSpectrum(float* buffer);
	
	void play();
	void pause();
	void stop();
	void clear();
	
	float getPixel(int x, int y);
	float getAmp(float x, float y);
	float getFreq(float y);
	
	int width;
	int height;
	int minHz;
	int maxHz;
	int offsetX;
	int offsetY;
	
	int counter;
	
	bool invert;
	bool square;
	bool playing;
	bool loadedMusicPlaying;
	
	float pixels[10000][BIT-1];
	float speed;
	float player;
	float ratio;
	float ratio2;
	
	GLuint texture1; 
	GLubyte image[10000][512][3];
	ofImage spectrumLoader;
	
	
	//ofxTiledTexture spectrumTexture;
	
	ofTrueTypeFont 	hertZ;
};
#endif