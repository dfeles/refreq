/*
 *  ofxFileDialogOSX.h
 *
 *  Created by timknapen on 07/05/10.
 *	www.wereldderindianen.be
 *	code stolen from 'mantissa' over here:
 *	http://www.openframeworks.cc/forum/viewtopic.php?p=5028#p5028
 *
 */


#ifndef _OFX_FILE_DIALOG_OSX_
#define _OFX_FILE_DIALOG_OSX_

#include "ofMain.h"

class ofxFileDialogOSX {
public:
	static int openFile(string& URL);
	static int saveFile(string& URL, string& fileURL);
private:
    
    
};

#endif