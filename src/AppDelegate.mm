
#import "AppDelegate.h"
#import <objc/runtime.h>

@implementation AppDelegate

@synthesize btnFeatured;
@synthesize toolBar;

BOOL	isDrawingCustomFrame = YES;

- (void) applicationDidFinishLaunching: (NSNotification*) notification {
	
	ofxNSWindower::instance()->addWindow(new mainApp(), "refreq", NSTitledWindowMask|NSClosableWindowMask|NSMiniaturizableWindowMask|NSResizableWindowMask, 30);
	
    
    mainWindow = ofxNSWindower::instance()->getWindowPtr("refreq")->getWindow();

    themeView = [ofxNSWindower::instance()->getWindowPtr("refreq")->getView() superview];
    
    
    NSUInteger adj = 6;
	
    [btnFeatured removeFromSuperview];
    btnFeatured.frame = NSMakeRect( btnFeatured.frame.origin.x,
                                        mainWindow.frame.size.height - btnFeatured.frame.size.height - adj,
                                        btnFeatured.frame.size.width, btnFeatured.frame.size.height);

    [themeView.window setToolbar:toolBar];
    [toolBar release];
    
}

- (void) applicationWillTerminate: (NSNotification*) notification {
    
	ofxNSWindower::destroy();
}


@end
