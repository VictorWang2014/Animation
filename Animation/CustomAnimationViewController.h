//
//  CustomAnimationViewController.h
//  Animation
//
//  Created by 王明权 on 7/23/14.
//  Copyright (c) 2014 com.gw.cn.MrsWang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomAnimationViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray *_tableSourceArray;
}

@property (strong, nonatomic) IBOutlet UITableView *customTableView;

@end
