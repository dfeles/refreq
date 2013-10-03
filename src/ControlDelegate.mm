#import "ControlDelegate.h"


@implementation ControlDelegate

@synthesize window;

- (id) init {
	if (self = [super init]) {
		//...
	}
	return self;
}

- (IBAction) submit: (id) sender {
	
	mainApp *refreqApp = (mainApp*) ofxNSWindower::instance()->getAppPtr("refreq");
	
	refreqApp->openFile();
}


- (IBAction) changeSpeed: (id) sender {
    
	
	mainApp *refreqApp = (mainApp*) ofxNSWindower::instance()->getAppPtr("refreq");
	
    [speedSlider setFloatValue:([sender floatValue])];
    [textfield setFloatValue:([sender floatValue])];
    refreqApp->setSpectrumSpeed([sender floatValue]);
    
}


- (IBAction) play: (id) sender {
    
	
	mainApp *refreqApp = (mainApp*) ofxNSWindower::instance()->getAppPtr("refreq");
	
    refreqApp->play();
}


- (IBAction) pause: (id) sender {
    
	
	mainApp *refreqApp = (mainApp*) ofxNSWindower::instance()->getAppPtr("refreq");
	
    refreqApp->stop();
    
}

- (IBAction) setMinHz: (id) sender {
    
	
	mainApp *refreqApp = (mainApp*) ofxNSWindower::instance()->getAppPtr("refreq");
	
    [minHz setFloatValue:([sender floatValue])];
    [minHz setStringValue: @"asdads"];
	refreqApp->setMinHz([sender floatValue]);
    
}

- (IBAction) setMaxHz: (id) sender {
    
	
	mainApp *refreqApp = (mainApp*) ofxNSWindower::instance()->getAppPtr("refreq");
	
    [maxHz setFloatValue:([sender floatValue])];
	refreqApp->setMaxHz([sender floatValue]);
    
}


@end
