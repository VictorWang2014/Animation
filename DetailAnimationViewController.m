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

@synthesize animationButton1 = _animationButton1;
@synthesize animationButton2 = _animationButton2;
@synthesize animationButton3 = _animationButton3;
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
    
    [self loadSelViewAnimationWithIndex:_index];
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
    if (_index == 2)
    {
        [_animationButton1 setHidden:NO];
        [_animationButton2 setHidden:NO];
        [_animationButton3 setHidden:NO];
    }else
    {
        [_animationButton1 setHidden:NO];
        [_animationButton2 setHidden:YES];
        [_animationButton3 setHidden:YES];
    }
    
//    [_animationImageView setBackgroundColor:[UIColor blueColor]];
//    CALayer *layer = _animationImageView.layer;
//    layer.cornerRadius = 20;
    
    _animationImageView.image = [UIImage imageNamed:@"traction_reply_highlight"];
}

- (void)loadSelViewAnimationWithIndex:(int)ind
{
    switch (ind) {
        case 0:
            [self loadCABasicAnimationScale];
            break;
        case 1:
            [self loadCABasicAnimationLinePath];
            break;
        case 2:
            [self loadCAKeyframeAnimationValues];
            break;
        case 3:
            [self loadCAKeyframeAnimationPathProperty];
            break;
        case 4:
            [self loadAnimationAfterAnotherAnimation];
            break;
        case 5:
            [self loadCAAnimationGroup];
            break;

        default:
            break;
    }
}

- (void)loadCABasicAnimationScale
{
    // CABasicAnimation scale
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.toValue = [NSNumber numberWithFloat:1.5];
    animation.duration = 3.0f;
    animation.repeatCount = 2;
    animation.autoreverses = YES;
    [_animationImageView.layer addAnimation:animation forKey:nil];
}

- (void)loadCABasicAnimationLinePath
{
    // CABasicAnimation line path
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(100, 100)];
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(200, 200)];
    animation.duration = 1.0f;
    animation.repeatCount = 1;
    animation.autoreverses = NO;
    animation.speed = 1.0;
    _animationImageView.layer.position = CGPointMake(200, 200);
    [_animationImageView.layer addAnimation:animation forKey:nil];
}

- (void)loadCAKeyframeAnimationValues
{
    // CAKeyFrameAnimation keyframe use values
    CAKeyframeAnimation *keyframeAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    keyframeAnimation.values = [NSArray arrayWithObjects:
                               [NSValue valueWithCGPoint:CGPointMake(100, 100)],
                               [NSValue valueWithCGPoint:CGPointMake(100, 150)],
                               [NSValue valueWithCGPoint:CGPointMake(100, 200)],
                               [NSValue valueWithCGPoint:CGPointMake(100, 250)], nil];
    keyframeAnimation.duration = 2.0f;
    keyframeAnimation.autoreverses = NO;
    keyframeAnimation.keyTimes = [NSArray arrayWithObjects:[NSNumber numberWithFloat:0.1],
                                                          [NSNumber numberWithFloat:0.3],
//                                  [NSNumber numberWithFloat:0.3],
//                                  [NSNumber numberWithFloat:0.4],
                                                          [NSNumber numberWithFloat:0.8],
                                                          [NSNumber numberWithFloat:1.0],
                                                            nil];
    [_animationImageView.layer setPosition:CGPointMake(100, 250)];
    [_animationImageView.layer addAnimation:keyframeAnimation forKey:nil];
    
}

- (void)loadCAKeyframeAnimationPathsRect
{
    // CAKeyFrameAnimation keyframe use path to draw rect animation
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, CGRectMake(120, 120, 150, 150));
//    CGPathAddRect(path, NULL, CGRectMake(150, 200, 150, 150));
//    CGPathAddRect(path, NULL, CGRectMake(200, 300, 150, 150));
//    CGPathAddRect(path, NULL, CGRectMake(250, 400, 150, 150));
    CAKeyframeAnimation *keyframeAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    keyframeAnimation.path = path;
    keyframeAnimation.duration = 2.0f;
    keyframeAnimation.autoreverses = YES;
    [_animationImageView.layer addAnimation:keyframeAnimation forKey:nil];
}

- (void)loadCAKeyframeAnimationPathsCircle
{
    // CAKeyFrameAnimation keyframe use path to draw circle animation
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path,NULL,50.0,275.0);
    CGPathAddCurveToPoint(path, NULL, 50.0,275.0,100.0,225.0,150,275);
    CGPathAddCurveToPoint(path,NULL,150.0,275.0,250.0,275.0,90.0,120.0);
//    CGPathAddCurveToPoint(path,NULL,250.0,275.0,350.0,275.0,110.0,120.0);
//    CGPathAddCurveToPoint(path,NULL,350.0,275.0,450.0,275.0,130.0,120.0);
    CAKeyframeAnimation *keyframeAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    keyframeAnimation.path = path;
    keyframeAnimation.duration = 2.0f;
    keyframeAnimation.autoreverses = YES;
    [_animationImageView.layer addAnimation:keyframeAnimation forKey:nil];
}

- (void)loadCAKeyframeAnimationPathProperty
{
    // CAKeyframeAnimatiom the bounce effect
    CAKeyframeAnimation *keyframeAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    
    CATransform3D scale1 = CATransform3DMakeScale(0.5, 0.5, 1);
    CATransform3D scale2 = CATransform3DMakeScale(1.2, 1.2, 1);
    CATransform3D scale3 = CATransform3DMakeScale(0.9, 0.9, 1);
    CATransform3D scale4 = CATransform3DMakeScale(1.0, 1.0, 1);
    
    NSArray *frameValues = [NSArray arrayWithObjects:
                            [NSValue valueWithCATransform3D:scale1],
                            [NSValue valueWithCATransform3D:scale2],
                            [NSValue valueWithCATransform3D:scale3],
                            [NSValue valueWithCATransform3D:scale4],
                            nil];
    
    [keyframeAnimation setValues:frameValues];
    
    NSArray *frameTimes = [NSArray arrayWithObjects:
                           [NSNumber numberWithFloat:0.0],
                           [NSNumber numberWithFloat:0.5],
                           [NSNumber numberWithFloat:0.9],
                           [NSNumber numberWithFloat:1.0],
                           nil];
    [keyframeAnimation setKeyTimes:frameTimes];
    
//    keyframeAnimation.fillMode = kCAFillModeForwards;
    keyframeAnimation.duration = 0.25;
    
    [_animationImageView.layer addAnimation:keyframeAnimation forKey:nil];
}

- (void)loadCAAnimationGroup
{
    CAKeyframeAnimation *keyframeAnimationSecond = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    keyframeAnimationSecond.values = [NSArray arrayWithObjects:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.8, 0.8, 1)],
                                      [NSValue valueWithCATransform3D:CATransform3DMakeScale(3.0, 3.0, 1)],
                                      [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.5, 0.5, 1)],
                                      [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1)], nil];
//    keyframeAnimationSecond.keyTimes = [NSArray arrayWithObjects:[NSNumber numberWithFloat:0.00],
//                                        [NSNumber numberWithFloat:0.50],
//                                        [NSNumber numberWithFloat:0.90],
//                                        [NSNumber numberWithFloat:1.0], nil];

    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, CGRectMake(120, 120, 150, 150));
    //    CGPathAddRect(path, NULL, CGRectMake(150, 200, 150, 150));
    //    CGPathAddRect(path, NULL, CGRectMake(200, 300, 150, 150));
    //    CGPathAddRect(path, NULL, CGRectMake(250, 400, 150, 150));
    CAKeyframeAnimation *keyframeAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    keyframeAnimation.path = path;

    //动画组
    CAAnimationGroup *animGroup = [CAAnimationGroup animation];
    animGroup.animations = [NSArray arrayWithObjects:keyframeAnimationSecond, keyframeAnimation, nil];
    animGroup.duration = 1;
    
    [_animationImageView.layer addAnimation:animGroup forKey:nil];
}

- (void)loadAnimationAfterAnotherAnimation
{
    CAKeyframeAnimation *keyframeAnimationFirst = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    keyframeAnimationFirst.duration = 0.5f;
    keyframeAnimationFirst.autoreverses = NO;
    keyframeAnimationFirst.values = [NSArray arrayWithObjects:[NSValue valueWithCGPoint:CGPointMake(100, 100)],
                                                             [NSValue valueWithCGPoint:CGPointMake(100, 200)],
                                                             [NSValue valueWithCGPoint:CGPointMake(100, 300)],
                                                             [NSValue valueWithCGPoint:CGPointMake(100, 400)], nil];
    keyframeAnimationFirst.keyTimes = [NSArray arrayWithObjects:[NSNumber numberWithFloat:0.00],
                                                               [NSNumber numberWithFloat:0.70],
                                                               [NSNumber numberWithFloat:0.90],
                                                               [NSNumber numberWithFloat:1.0], nil];
    _animationImageView.layer.position = CGPointMake(100, 400);
    [_animationImageView.layer addAnimation:keyframeAnimationFirst forKey:nil];
    
    [self performSelector:@selector(aaaa) withObject:nil afterDelay:0.5];
}

- (void)aaaa
{
    CAKeyframeAnimation *keyframeAnimationSecond = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    keyframeAnimationSecond.duration = 0.15f;
    keyframeAnimationSecond.autoreverses = NO;
    keyframeAnimationSecond.values = [NSArray arrayWithObjects:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.8, 0.8, 1)],
                                      [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2, 1.2, 1)],
                                      [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9, 0.9, 1)],
                                      [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1)], nil];
    keyframeAnimationSecond.keyTimes = [NSArray arrayWithObjects:[NSNumber numberWithFloat:0.00],
                                        [NSNumber numberWithFloat:0.50],
                                        [NSNumber numberWithFloat:0.90],
                                        [NSNumber numberWithFloat:1.0], nil];
    [_animationImageView.layer addAnimation:keyframeAnimationSecond forKey:nil];
    

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

- (IBAction)animationButtonClick:(UIButton *)sender
{
    switch (_index) {
        case 0:
            [self loadCABasicAnimationScale];
            break;
        case 1:
            [self loadCABasicAnimationLinePath];
            break;
        case 2:
            if (sender.tag == 0)
            {
                [self loadCAKeyframeAnimationValues];
            }
            if (sender.tag == 1)
            {
                [self loadCAKeyframeAnimationPathsRect];
            }
            if (sender.tag == 2)
            {
                [self loadCAKeyframeAnimationPathsCircle];
            }
            break;
        case 3:
            [self loadCAKeyframeAnimationPathProperty];
            break;
        case 4:
            [self loadAnimationAfterAnotherAnimation];
            break;
        case 5:
            [self loadCAAnimationGroup];
            break;
        default:
            break;
    }

}

@end
