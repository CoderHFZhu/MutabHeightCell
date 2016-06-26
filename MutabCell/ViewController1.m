//
//  ViewController1.m
//  MutabCell
//
//  Created by zack on 16/5/30.
//  Copyright © 2016年 ZACK. All rights reserved.
//

#import "ViewController1.h"

@interface ViewController1 ()
@property (weak, nonatomic) IBOutlet UILabel *lab;

@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.lab.text = [self.lab.text stringByAppendingString:@"法制晚报讯哥伦比亚在2015年放宽了针对中国商人、游客的签证限制，当地华商数量大幅增长。但在本月26日，哥伦比亚华商朋友圈中却传播着一条信息：“哥伦比亚商贩打砸华商商铺，威胁将华人华商赶出哥伦比亚”。"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
