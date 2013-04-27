//
//  StatusBarAppAppDelegate.h
//  StatusBarApp
//
//  Created by CCoding on 18.09.11.
//  Copyright 2011 CCoding. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface StatusBarAppAppDelegate : NSObject <NSApplicationDelegate> {
    IBOutlet NSMenu *statusMenu;
    NSStatusItem *statusItem;
    NSImage *statusImage;
    NSImage *statusHighlightImage;
    
}

//optional

- (IBAction)turnOff:(id)sender;
- (IBAction)setRed:(id)sender;
- (IBAction)setGreen:(id)sender;
- (IBAction)setBlue:(id)sender;
- (IBAction)setYellow:(id)sender;
- (IBAction)setTurquoise:(id)sender;
- (IBAction)setWhite:(id)sender;
- (IBAction)setPink:(id)sender;

@property (assign) IBOutlet NSWindow *window;

@end
