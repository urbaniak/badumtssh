//
//  ViewController.m
//  Ba dum tsssh!
//
//  Created by Krzysztof Urbaniak on 4/17/12.
//

#import "ViewController.h"
#import <AVFoundation/AVAudioPlayer.h>

@interface ViewController()
@property (nonatomic, strong) NSURL *path;
@end

@implementation ViewController
@synthesize path = _path;

- (void)threadedPlayer {
	AVAudioPlayer *audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:self.path error:NULL];
	[audioPlayer prepareToPlay];
	[audioPlayer play];
	[NSThread sleepForTimeInterval:4];
	[audioPlayer stop];
}

- (void)buttonAction {
	[NSThread detachNewThreadSelector:@selector(threadedPlayer) toTarget:self withObject:nil];
}

- (void)loadView {
	self.view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
	
	self.view.backgroundColor = [UIColor blackColor]; //[[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"bg.png"]];
	
	UIButton *myButton = [[UIButton alloc] init];
	[myButton addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchDown];

	[myButton setFrame:CGRectMake( 0.0f, 0.0f, 200.0f, 200.0f)];
	
	[myButton setImage:[UIImage imageNamed:@"button.png"] forState:UIControlStateNormal];
	[myButton setImage:[UIImage imageNamed:@"button1.png"] forState:UIControlStateHighlighted];
	[myButton setImage:[UIImage imageNamed:@"button1.png"] forState:UIControlStateSelected];
	myButton.contentMode = UIViewContentModeScaleToFill;
		
	CGSize bounds = self.view.bounds.size;
	myButton.center = CGPointMake(bounds.width / 2, bounds.height / 2);
	
	[self.view addSubview:myButton]; 
}

- (void)viewDidLoad {
    [super viewDidLoad];
	self.path = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"badumtssh" ofType:@"wav"]];
	AVAudioPlayer *audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:self.path error:NULL];
	[audioPlayer prepareToPlay];
}

@end
