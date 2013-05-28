//
//  ScrollingAppDelegate.h
//  Scrolling
//
//  Created by David Janes on 09-09-25.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ScrollingViewController;

@interface ScrollingAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    ScrollingViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet ScrollingViewController *viewController;

@end

