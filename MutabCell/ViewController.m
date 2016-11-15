//
//  ViewController.m
//  MutabCell
//
//  Created by zack on 16/5/30.
//  Copyright © 2016年 ZACK. All rights reserved.
//

#import "ViewController.h"
#import "XMGMessage.h"
#import "TableViewCell.h"
#import "ViewController1.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSArray *messages;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
static NSString *const kTableViewCell = @"TableViewCell";

@implementation ViewController
- (NSArray *)messages
{
    if (_messages == nil) {
        // 加载plist中的字典数组
        NSString *path = [[NSBundle mainBundle] pathForResource:@"messages.plist" ofType:nil];
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
        
        // 字典数组 -> 模型数组
        NSMutableArray *messageArray = [NSMutableArray array];
        // 用来记录上一条消息模型
        XMGMessage *lastMessage = nil;
        for (NSDictionary *dict in dictArray) {
            XMGMessage *message = [XMGMessage messageWithDict:dict];
            [messageArray addObject:message];
            
            lastMessage = message;
        }
        
        _messages = messageArray;
    }
    return _messages;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"%s,line num = %d \n %@",__func__,__LINE__,NSStringFromCGRect(self.view.frame));

    self.view.autoresizingMask = UIViewAutoresizingNone;
    NSLog(@"%s,line num = %d \n %@",__func__,__LINE__,NSStringFromCGRect(self.view.frame));

     self.tableView.autoresizingMask = UIViewAutoresizingNone;
    
    [self.tableView registerNib:[UINib nibWithNibName:kTableViewCell bundle:nil] forCellReuseIdentifier:kTableViewCell];
//
}
#pragma mark -----tableview delegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.messages.count;
}
#pragma mark - <UITableViewDelegate>
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
//    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
//        [cell setSeparatorInset:UIEdgeInsetsMake(0, 15, 0, 15)];
//    }
//    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
//        [cell setSeparatorInset:UIEdgeInsetsMake(0, 30, 0, 15)];
//    }
    if ([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]) {
        [cell setPreservesSuperviewLayoutMargins:NO];
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XMGMessage *message = self.messages[indexPath.row];
    return message.cellHeight;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell   = [tableView dequeueReusableCellWithIdentifier:kTableViewCell];
    cell.message = self.messages[indexPath.row];
    return cell;
    
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self presentViewController:[ViewController1 new] animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
