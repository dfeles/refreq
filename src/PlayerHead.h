/*
 *  spectrumDrawer.h
 *  emptyExample
 *
 *  Created by Feles Daniel on 11/12/10.
 *  Copyright 2010 Kitchen Budapest. All rights reserved.
 *
 */
#ifndef PLAYERHEAD
#define PLAYERHEAD

#include "PlayerHead.h"
#include "ofMain.h"

class PlayerHead{
public:
	PlayerHead();

	int distance(int _x1, int _x2, int _y1, int _y2);
	int x1,y1;
	int x2,y2;
	
	
	vector< pair <float,float > > getPoints(int bit);
	
	void update();
	void mouseMoved(ofMouseEventArgs &e);
	void mousePressed(ofMouseEventArgs &e);	
	void mouseDragged(ofMouseEventArgs &e);	
	void mouseReleased(ofMouseEventArgs &e);

private:
	bool dragging1;
	bool dragging2;
};
#endif