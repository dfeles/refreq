#include "mainApp.h"

#import <Cocoa/Cocoa.h>


@interface AppDelegate : NSObject <NSApplicationDelegate> {
	NSWindow *mainWindow;
    NSView *themeView;
    
    NSButton * btnFeatured;
    
    NSToolbar * toolBar;
}

@property (assign) IBOutlet NSButton *btnFeatured;
@property (assign) IBOutlet NSToolbar *toolBar;
@end
