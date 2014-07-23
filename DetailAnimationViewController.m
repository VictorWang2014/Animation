//
//  DetailAnimationViewController.m
//  Animation
//
//  Created by 王明权 on 7/23/14.
//  Copyright (c) 2014 com.gw.cn.MrsWang. All rights reserved.
//

#import "DetailAnimationViewController.h"

@interface DetailAnimationViewController ()

@end

@implementation DetailAnimationViewController

@synthesize index = _index;
@synthesize animationImageView = _animationImageView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createPureImageView];
    
    [self loadSelViewWithIndex:_index];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)createPureImageView
{
//    CGSize size = _animationImageView.frame.size;
//    UIGraphicsBeginImageContextWithOptions(size, YES, 0.0);
//    [[UIColor blueColor] set];
//    UIRectFill(CGRectMake(0, 0, size.width, size.height));
//    _animationImageView.image = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    CALayer *layer = _animationImageView.layer;
//    layer.cornerRadius = 20;
    
    [_animationImageView setBackgroundColor:[UIColor blueColor]];
    CALayer *layer = _animationImageView.layer;
    layer.cornerRadius = 20;
}

- (void)loadSelViewWithIndex:(int)ind
{
    switch (ind) {
        case 0:
            [self loadSelView0];
            break;
        case 1:
            [self loadSelView1];
            break;
        case 2:
            [self loadSelView2];
            break;
            
        default:
            break;
    }
}

- (void)loadSelView0
{
    // CABaseAnimation
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.toValue = [NSNumber numberWithFloat:1.5];
    animation.duration = 1.0f;
    animation.repeatCount = 2;
    animation.autoreverses = YES;
    [_animationImageView.layer addAnimation:animation forKey:nil];
    
}

- (void)loadSelView1
{
    // CAKeyFrameAnimation
}

- (void)loadSelView2
{
    // CAAnimationGroup
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
