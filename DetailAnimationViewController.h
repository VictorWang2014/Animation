//
//  DetailAnimationViewController.h
//  Animation
//
//  Created by 王明权 on 7/23/14.
//  Copyright (c) 2014 com.gw.cn.MrsWang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailAnimationViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *animationButton1;
@property (strong, nonatomic) IBOutlet UIButton *animationButton2;
@property (strong, nonatomic) IBOutlet UIButton *animationButton3;
@property (nonatomic, strong) IBOutlet UIImageView *animationImageView;
@property NSInteger index;

- (IBAction)animationButtonClick:(UIButton *)sender;
@end
