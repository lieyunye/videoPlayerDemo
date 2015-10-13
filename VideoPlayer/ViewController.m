//
//  ViewController.m
//  VideoPlayer
//
//  Created by lieyunye on 10/12/15.
//  Copyright © 2015 lieyunye. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()
{
    AVPlayer *_player;

}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _player = [[AVPlayer alloc] init];
    
    NSString *videoPath = [[NSBundle mainBundle] pathForResource:@"sss" ofType:@"mp4"];
    NSURL *videoURL = [NSURL fileURLWithPath:videoPath];
    AVURLAsset *asset = [AVURLAsset URLAssetWithURL:videoURL options:nil];
    AVPlayerItem *anItem = [AVPlayerItem playerItemWithAsset:asset];
    [_player replaceCurrentItemWithPlayerItem:anItem];
    [_player play];
    
    AVPlayerLayer *playLayer = [AVPlayerLayer playerLayerWithPlayer:_player];
    playLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    playLayer.frame = self.view.bounds;
    playLayer.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:playLayer];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
