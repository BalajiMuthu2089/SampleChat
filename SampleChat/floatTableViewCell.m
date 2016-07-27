//
//  floatTableViewCell.m
//  floatingButtonTrial
//
//

#import "floatTableViewCell.h"

@implementation floatTableViewCell
@synthesize imgView, title,overlay;

- (void)awakeFromNib{
    // Initialization code
    overlay = [UIView new];
    overlay.backgroundColor = [UIColor colorWithWhite:0.2 alpha:0.6];
    [title addSubview:overlay];
    self.imgView.layer.cornerRadius = 45/2;
    self.imgView.layer.masksToBounds = YES;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor clearColor];
    self.contentView.transform = CGAffineTransformMakeRotation(-M_PI);
}


-(void)setTitle:(NSString*)txt andImage:(UIImage*)img{
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end
