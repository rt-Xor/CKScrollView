//
//  ScrollingViewController.m
//  Scrolling
//
//  Created by David Janes on 09-09-25.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "ScrollingViewController.h"

@implementation ScrollingViewController
@synthesize scrollView;
@synthesize pageControl;

#pragma mark -
#pragma mark UIView boilerplate
- (void)viewDidLoad
{
	[self setupPage];
    [super viewDidLoad];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload
{
	[scrollView release];
	[pageControl release];
}


- (void)dealloc
{
    [super dealloc];
}

#pragma mark -
#pragma mark The Guts
- (void)setupPage
{
	scrollView.delegate = self;
    
	[self.scrollView setBackgroundColor:[UIColor blackColor]];
	[scrollView setCanCancelContentTouches:NO];
	
	scrollView.indicatorStyle = UIScrollViewIndicatorStyleWhite;
	scrollView.clipsToBounds = YES;
	scrollView.scrollEnabled = YES;
	scrollView.pagingEnabled = YES;
	
    NSArray *colorArray = [NSArray arrayWithObjects:[UIColor blueColor],[UIColor grayColor],[UIColor orangeColor],[UIColor magentaColor],[UIColor yellowColor], nil];
    
    int x = 10;
  	for (int i = 0; i < 5 ; i++) {
        //		NSString *imageName = [NSString stringWithFormat:@"image%d.jpg", (nimages + 1)];
        //		UIImage *image = [UIImage imageNamed:imageName];
        //		if (image == nil) {
        //			break;
        //		}
        //		UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        //
        //		CGRect rect = imageView.frame;
        //		rect.size.height = image.size.height;
        //		rect.size.width = image.size.width;
        //		rect.origin.x = ((scrollView.frame.size.width - image.size.width) / 2) + cx;
        //		rect.origin.y = ((scrollView.frame.size.height - image.size.height) / 2);
        //
        //		imageView.frame = rect;
        
        
        UIScrollView *tempView  = [[UIScrollView alloc] initWithFrame:CGRectMake(x, 40, 300,450)];
        [tempView setContentSize:CGSizeMake(300, 1000)];
        tempView.bounces = NO;
        tempView.backgroundColor = [colorArray objectAtIndex:i];
        
        UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(30, 70, 100, 20)];
        label1.textColor = [UIColor blackColor];
        [tempView addSubview:label1];
        
        UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(30, 600, 100, 20)];
        label2.textColor = [UIColor blackColor];
        [tempView addSubview:label2];
        
        scrollView.backgroundColor = [UIColor yellowColor];
        [scrollView addSubview:tempView];
        
        x= tempView.frame.size.width + 30 +x;
		//cx += scrollView.frame.size.width;
	}
	
	self.pageControl.numberOfPages = 5;
    scrollView.showsVerticalScrollIndicator = YES;
    scrollView.showsHorizontalScrollIndicator = YES;
    scrollView.delaysContentTouches = NO;
    
	[scrollView setContentSize:CGSizeMake(320*5, scrollView.frame.size.height)];
}



#pragma mark -
#pragma mark UIScrollViewDelegate stuff

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)_scrollView{
    
    if (_scrollView == scrollView) {
        NSLog(@"inside scrollView");
    }
    else {
    
        NSLog(@"outside scrollview");
    }

}

- (void)scrollViewDidScroll:(UIScrollView *)_scrollView
{
    if (pageControlIsChangingPage) {
        return;
    }
    
	/*
	 *	We switch page at 50% across
	 */
    CGFloat pageWidth = _scrollView.frame.size.width;
    int page = floor((_scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    pageControl.currentPage = page;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)_scrollView
{
    pageControlIsChangingPage = NO;
}

#pragma mark -
#pragma mark PageControl stuff
- (IBAction)changePage:(id)sender
{
	/*
	 *	Change the scroll view
	 */
    CGRect frame = scrollView.frame;
    frame.origin.x = frame.size.width * pageControl.currentPage;
    frame.origin.y = 0;
	
    [scrollView scrollRectToVisible:frame animated:YES];
    
	/*
	 *	When the animated scrolling finishings, scrollViewDidEndDecelerating will turn this off
	 */
    pageControlIsChangingPage = YES;
}

@end
