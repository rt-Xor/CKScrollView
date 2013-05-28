//
//  ScrollingAppDelegate.m
//  Scrolling
//
//  Created by David Janes on 09-09-25.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "ScrollingAppDelegate.h"
#import "ScrollingViewController.h"

@implementation ScrollingAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
