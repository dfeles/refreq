/*
 *  PlayerHead.cpp
 *  emptyExample
 *
 *  Created by Feles Daniel on 11/13/10.
 *  Copyright 2010 Kitchen Budapest. All rights reserved.
 *
 */

#include "PlayerHead.h"

//--------------------------------------------------------------
PlayerHead::PlayerHead(){
	cout << "hello";
	x1 = 80;
	y1 = 10;
	x2 = 80;
	y2 = 522;
	
	dragging1=false;
	dragging2=false;
	
	
	ofAddListener(ofEvents.mousePressed, this, &PlayerHead::mousePressed);
	//ofAddListener(ofEvents.mouseMoved, this, &PlayerHead::mouseMoved);
	ofAddListener(ofEvents.mouseDragged, this, &PlayerHead::mouseDragged);
	ofAddListener(ofEvents.mouseReleased, this, &PlayerHead::mouseReleased);
}


void PlayerHead::update(){
	ofSetColor(255, 255, 255);
	ofCircle(x1, y1, 3);
	ofCircle(x2, y2, 3);
	ofLine(x1, y1, x2, y2);
}

void PlayerHead::mouseMoved(ofMouseEventArgs &e) {
	//cout << "hello";
}

void PlayerHead::mousePressed(ofMouseEventArgs &e) {
	//if(e.x>x-10 and e.x<x+10){
	//	dragging = true;
	//}
	
	if(distance(e.x,x1,e.y,y1)<10){
		dragging1 = true;
	}
	if(distance(e.x,x2,e.y,y2)<10){
		dragging2 = true;
	}
}

void PlayerHead::mouseDragged(ofMouseEventArgs &e) {
	if(dragging1){
		if(e.x<80){
			x1 = fmax(e.x, 80);
		}else {
			x1 = fmin(e.x, ofGetWidth()-10);
		}

		if (e.y<10) {
			y1 = fmax(e.y, 10);
		}else {
			y1 = fmin(e.y, 522);
		}
	}
	if(dragging2){
		if(e.x<80){
			x2 = fmax(e.x, 80);
		}else {
			x2 = fmin(e.x, ofGetWidth()-10);
		}
		
		if (e.y<10) {
			y2 = fmax(e.y, 10);
		}else {
			y2 = fmin(e.y, 522);
		}
	}
}
vector< pair <float,float > > PlayerHead::getPoints(int bit){
	vector< pair <float,float > > tomb;
	for (int i = 0; i<bit; i++) {
		pair <float,float > point;
		float _X = (float)(x2-x1)/(float)bit * (float)i;
		
		float _Y = (float)(y2-y1)/(float)bit * (float)i;
		
		_X += x1;
		_Y += y1;
		point.first = _X;
		point.second = _Y;
		tomb.push_back(point);
	}
	return tomb;
}
int fmax (int a,int b){
	if(a>=b){
		return a;
	}else {
		return b;
	}
}
int fmin (int a,int b){
	if(a>=b){
		return b;
	}else {
		return a;
	}	
}
int PlayerHead::distance(int _x1, int _x2, int _y1, int _y2){
	return sqrt(pow(_x2-_x1,2) + pow(_y2-_y1,2));
}

void PlayerHead::mouseReleased(ofMouseEventArgs &e) {
	if(dragging1){
		dragging1 = false;
	}
	if(dragging2){
		dragging2 = false;
	}
}