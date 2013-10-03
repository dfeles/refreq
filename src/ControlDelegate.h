#include "mainApp.h"
#include "ofxNSWindower.h"

#import <Cocoa/Cocoa.h>


@interface ControlDelegate : NSObject <NSApplicationDelegate> {
    
    NSWindow * window;
    NSArray * values;
    
    IBOutlet NSSlider *speedSlider;
	IBOutlet NSTextField *textfield,  *minHz,  *maxHz;    
}

@property (assign) IBOutlet NSWindow *window;

- (IBAction) submit: (id) sender;
- (IBAction) changeSpeed: (id) sender;
- (IBAction) play: (id) sender;
- (IBAction) pause: (id) sender;
- (IBAction) setMinHz: (id) sender;
- (IBAction) setMaxHz: (id) sender;

@end
