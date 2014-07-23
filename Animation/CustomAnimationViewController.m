//
//  CustomAnimationViewController.m
//  Animation
//
//  Created by 王明权 on 7/23/14.
//  Copyright (c) 2014 com.gw.cn.MrsWang. All rights reserved.
//

#import "CustomAnimationViewController.h"
#import "DetailAnimationViewController.h"

@interface CustomAnimationViewController ()

@end

@implementation CustomAnimationViewController

@synthesize customTableView = _customTableView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _tableSourceArray = [@[@"animation1", @"animation2", @"animation3", @"animation4", @"animation5", @"animation6", @"animation7", @"animation8"] mutableCopy];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_tableSourceArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"customtableviewcell"];
    cell.textLabel.text = [_tableSourceArray objectAtIndex:indexPath.row];
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UITableViewCell *cell = (UITableViewCell *)sender;
    NSIndexPath *indexPath = [_customTableView indexPathForCell:cell];
    DetailAnimationViewController *detailAnimationViewController = (DetailAnimationViewController *)segue.destinationViewController;
    detailAnimationViewController.index = indexPath.row;
    
}

@end
