//
//  UserProfileViewController.h
//  SampleChat
//
//  Created by Ramdhas on 27/06/16.
//  Copyright © 2016 balaji. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserProfileViewController : UIViewController{

}

//@property (weak, nonatomic) IBOutlet UILabel *Label1;
//@property (weak, nonatomic) IBOutlet UILabel *Label2;@property (weak, nonatomic) IBOutlet UILabel *FollowersLabel;
@property (weak, nonatomic) IBOutlet UILabel *FollowingLabel;
@property (weak, nonatomic) IBOutlet UILabel *FollowersLabel;

- (IBAction)backButton:(id)sender;

@end
