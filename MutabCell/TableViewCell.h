//
//  TableViewCell.h
//  MutabCell
//
//  Created by zack on 16/5/30.
//  Copyright © 2016年 ZACK. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XMGMessage;
@interface TableViewCell : UITableViewCell
@property (nonatomic, strong) XMGMessage *message;

@end
