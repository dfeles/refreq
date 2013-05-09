#include "ofMain.h"
#include "mainApp.h"
#include "ofAppGlutWindow.h"

//========================================================================
int main(){

    ofAppGlutWindow window;
	window.setGlutDisplayString("rgba double samples>=4 depth");
	ofSetupOpenGL(&window, 800,700, OF_WINDOW);			// <-------- setup the GL context

	// this kicks off the running of my app
	// can be OF_WINDOW or OF_FULLSCREEN
	// pass in width and height too:
	ofRunApp( new mainApp());

}
