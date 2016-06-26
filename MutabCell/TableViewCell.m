//
//  TableViewCell.m
//  MutabCell
//
//  Created by zack on 16/5/30.
//  Copyright © 2016年 ZACK. All rights reserved.
//

#import "TableViewCell.h"
#import "XMGMessage.h"
@interface TableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *lab;

@end;
@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
//    self.contentView.autoresizingMask = UIViewAutoresizingNone;
//    CGRect frame = self.lab.frame;
//    frame.size.width = [UIScreen mainScreen].bounds.size.width - 120;
//    self.lab.frame = frame;
//    [self layoutIfNeeded];
//    [self layoutSubviews];
//    NSLog(@"%s,line num = %d \n %@",__func__,__LINE__,NSStringFromCGRect(self.frame));
//    self.lab.autoresizingMask = UIViewAutoresizingFlexibleWidth;
//    NSLog(@"%s,line num = %d \n %@",__func__,__LINE__,NSStringFromCGRect(self.lab.frame));
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setMessage:(XMGMessage *)message
{
    _message = message;
    

    [self.lab layoutIfNeeded];

    // 处理显示的消息文字
    // 设置按钮的文字
    self.lab.text = self.message.text;

    NSLog(@"%s,line num = %d \n %@",__func__,__LINE__,NSStringFromCGRect(self.lab.frame));
    [self layoutIfNeeded];

//    self.message.cellHeight = CGRectGetMaxY(self.lab.frame) + 20;
//
//    // 强制更新
//    [self layoutIfNeeded];
// CGSize detailSize = [@"你的字符串" sizeWithFont:[UIFont systemFontOfSize:15] constrainedToSize:CGSizeMake(200, MAXFLOAT) lineBreakMode:UILineBreakModeWordWrap];
    CGSize detailSize = [self.message.text boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - 120, 10000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size;
//
//    // 强制更新
//    // 计算当前cell的高度
    self.message.cellHeight = detailSize.height + 20;
    [self layoutIfNeeded];

}
//-(void)layoutIfNeeded {
//    NSLog(@"%s,line num = %d \n %@",__func__,__LINE__,NSStringFromCGRect(self.lab.frame));
//
//}
-(void)layoutSubviews{
    [super layoutSubviews];


}

@end
