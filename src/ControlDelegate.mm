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
	
	//grab the texfield value and convert to a C string
	
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
    
    /*
    NSString *s = @"▌▌";
    
    //[sender setTitleFont:[NSFont fontWithName:@"Lucida Grande 11"]];
    [sender setTitle:(s)];
     */
}


- (IBAction) pause: (id) sender {
    
	
	mainApp *refreqApp = (mainApp*) ofxNSWindower::instance()->getAppPtr("refreq");
	
	//refreqApp->setSpeed([sender floatValue]);
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
