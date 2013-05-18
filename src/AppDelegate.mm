
#import "AppDelegate.h"
#import <objc/runtime.h>

@implementation AppDelegate

@synthesize btnFeatured;
@synthesize toolBar;

BOOL	isDrawingCustomFrame = YES;

- (void) applicationDidFinishLaunching: (NSNotification*) notification {
	
	//simple way...
	ofxNSWindower::instance()->addWindow(new mainApp(), "refreq", NSTitledWindowMask|NSClosableWindowMask|NSMiniaturizableWindowMask|NSResizableWindowMask, 30);
	
    
    mainWindow = ofxNSWindower::instance()->getWindowPtr("refreq")->getWindow();

    themeView = [ofxNSWindower::instance()->getWindowPtr("refreq")->getView() superview];
    
    
    NSUInteger adj = 6;
	
    [btnFeatured removeFromSuperview];
    btnFeatured.frame = NSMakeRect( btnFeatured.frame.origin.x,
                                        mainWindow.frame.size.height - btnFeatured.frame.size.height - adj,
                                        btnFeatured.frame.size.width, btnFeatured.frame.size.height);
   // [themeView addSubview:btnFeatured];

    [themeView.window setToolbar:toolBar];
    [toolBar release];
    
    /*
	Method m0 = class_getInstanceMethod([self class], @selector(drawRect:));
	class_addMethod(class, @selector(drawRectOriginal:), method_getImplementation(m0), method_getTypeEncoding(m0));
	
	Method m1 = class_getInstanceMethod(class, @selector(drawRect:));
	Method m2 = class_getInstanceMethod(class, @selector(drawRectOriginal:));
	
	method_exchangeImplementations(m1, m2);
    */
}
/*
//// TODO LATER i want to paint black the top bar
- (IBAction)toggleDrawing:(id)sender
{
	NSLog(@"toggle drawing");
	isDrawingCustomFrame = !isDrawingCustomFrame;
	id window = [[[NSApplication sharedApplication] windows] objectAtIndex:0];
	[[[window contentView] superview] setNeedsDisplay:YES];
}


- (void)drawRect:(NSRect)rect
{
	// Call original drawing method
	[self drawRectOriginal:rect];
    
	if (!isDrawingCustomFrame)	return;
    
	//
	// Build clipping path : intersection of frame clip (bezier path with rounded corners) and rect argument
	//
	NSRect windowRect = [[self window] frame];
	windowRect.origin = NSMakePoint(0, 0);
    
	float cornerRadius = [self roundedCornerRadius];
	[[NSBezierPath bezierPathWithRoundedRect:windowRect xRadius:cornerRadius yRadius:cornerRadius] addClip];
	[[NSBezierPath bezierPathWithRect:rect] addClip];
    
	//
	// Draw background image (extend drawing rect : biggest rect dimension become's rect size)
	//
	NSRect imageRect = windowRect;
	if (imageRect.size.width > imageRect.size.height)
	{
		imageRect.origin.y = -(imageRect.size.width-imageRect.size.height)/2;
		imageRect.size.height = imageRect.size.width;
	}
	else
	{
		imageRect.origin.x = -(imageRect.size.height-imageRect.size.width)/2;
		imageRect.size.width = imageRect.size.height;
	}
	[[NSImage imageNamed:NSImageNameActionTemplate] drawInRect:imageRect fromRect:NSZeroRect operation:NSCompositeSourceAtop fraction:0.15];
    
	//
	// Draw a background color on top of everything
	//
	CGContextRef context = [[NSGraphicsContext currentContext]graphicsPort];
	CGContextSetBlendMode(context, kCGBlendModeColorDodge);
	[[NSColor colorWithCalibratedRed:0.7 green:0.4 blue:0 alpha:0.4] set];
	[[NSBezierPath bezierPathWithRect:rect] fill];
}
 */

- (void) applicationWillTerminate: (NSNotification*) notification {
    
	ofxNSWindower::destroy();
}


@end
