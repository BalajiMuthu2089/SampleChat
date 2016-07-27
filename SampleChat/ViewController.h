//
//  ViewController.h
//  SampleChat
//
//  Created by Ramdhas on 04/06/16.
//  Copyright © 2016 balaji. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VCFloatingActionButton.h"
#import "SWRevealViewController.h"
#import "SampleChat-Swift.h"
#import "CustomeCell.h"

@interface ViewController : UIViewController <floatMenuDelegate,UITableViewDelegate, UITableViewDataSource,LGChatControllerDelegate>{
    NSDictionary *content;
    NSArray *Keys;
}

@property (strong, nonatomic)NSArray  *detailArray;
@property (weak, nonatomic) IBOutlet UIButton *SidebarButton;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) VCFloatingActionButton *addButton;
@property (strong, nonatomic)NSArray *allValues;

- (IBAction)SidebarButton:(id)sender;
- (IBAction)settingsButton:(id)sender;

@end

