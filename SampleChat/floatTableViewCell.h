//
//  floatTableViewCell.h
//  floatingButtonTrial
//
//

#import <UIKit/UIKit.h>

@interface floatTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (strong,nonatomic) UIView *overlay;
-(void)setTitle:(NSString*)txt andImage:(UIImage*)img;

@end
