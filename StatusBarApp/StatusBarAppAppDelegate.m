//
//  StatusBarAppAppDelegate.m
//  StatusBarApp
//
//  Created by CCoding on 18.09.11.
//  Copyright 2011 CCoding. All rights reserved.
//

#import "StatusBarAppAppDelegate.h"

@implementation StatusBarAppAppDelegate

@synthesize window;

- (void)awakeFromNib {
    
    statusItem = [[[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength] retain];
    
    NSBundle *bundle = [NSBundle mainBundle];
    
    statusImage = [[NSImage alloc] initWithContentsOfFile:[bundle pathForResource:@"icon_normal" ofType:@"png"]];
    statusHighlightImage = [[NSImage alloc] initWithContentsOfFile:[bundle pathForResource:@"icon_highlight" ofType:@"png"]]; 
    
    [statusItem setImage:statusImage];
    [statusItem setAlternateImage:statusHighlightImage];
    [statusItem setMenu:statusMenu];
    [statusItem setHighlightMode:YES];
    
}

- (void)dealloc {
    
    [statusImage release];
    [statusHighlightImage release];
    [super dealloc];
}

- (IBAction)turnOff:(id)sender {
    RGBColor color;
    color.red = 0;
    color.green = 0;
    color.blue = 0;
    [self setColor:color];
}

-(IBAction)setRed:(id)sender {
    RGBColor color;
    color.red = 255;
    color.green = 0;
    color.blue = 0;
    [self setColor:color];
}

- (IBAction)setGreen:(id)sender {
    RGBColor color;
    color.red = 0;
    color.green = 255;
    color.blue = 0;
    [self setColor:color];
}
- (IBAction)setBlue:(id)sender {
    RGBColor color;
    color.red = 0;
    color.green = 0;
    color.blue = 255;
    [self setColor:color];
}
- (IBAction)setYellow:(id)sender {
    RGBColor color;
    color.red = 255;
    color.green = 255;
    color.blue = 0;
    [self setColor:color];
}
- (IBAction)setTurquoise:(id)sender {
    RGBColor color;
    color.red = 0;
    color.green = 255;
    color.blue = 255;
    [self setColor:color];
}
- (IBAction)setWhite:(id)sender {
    RGBColor color;
    color.red = 255;
    color.green = 255;
    color.blue = 255;
    [self setColor:color];
}
- (IBAction)setPink:(id)sender {
    RGBColor color;
    color.red = 255;
    color.green = 0;
    color.blue = 255;
    [self setColor:color];
}

-(void) setColor:(RGBColor)color {
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    NSString *url = [NSString stringWithFormat:@"http://192.168.178.55/?red=%i&green=%i&blue=%i", color.red, color.green, color.blue];
    [request setHTTPMethod:@"GET"];
    [request setURL:[NSURL URLWithString:url]];
    
    NSError *error = [[NSError alloc] init];
    NSHTTPURLResponse *responseCode = nil;
    [NSURLConnection sendSynchronousRequest:request returningResponse:&responseCode error:&error];
    
    if([responseCode statusCode] != 200){
        NSLog(@"Error getting %@, HTTP status code %li", url, [responseCode statusCode]);
    }
}

@end
