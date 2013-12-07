//
//  ViewController.m
//  UITextfieldDemo
//
//  Created by zhou on 13-12-7.
//  Copyright (c) 2013年 zhou. All rights reserved.
//

#import "ViewController.h"

#import <QuartzCore/QuartzCore.h>

@interface ViewController () {
    
    UITextField* textField_1;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    CGRect frame = CGRectMake(60, 100, 200, 30);//默认高度30
    textField_1 = [[UITextField alloc]initWithFrame:frame];
    // 风格
    textField_1.borderStyle = UITextBorderStyleRoundedRect;
    // 占位
    textField_1.placeholder = @"please";
    textField_1.textColor = [UIColor purpleColor];
    textField_1.clearsOnBeginEditing = YES;
    // 边框背景图
    textField_1.layer.borderWidth = 4.0f;
    textField_1.layer.borderColor = [[UIColor colorWithPatternImage:[UIImage imageNamed:@"textField_bg"]]CGColor];
    //清除按钮显示
    textField_1.clearButtonMode = UITextFieldViewModeAlways;
    [self.view addSubview:textField_1];
    // 设置代理
    textField_1.delegate = self; // 别忘了
    
    // 把returnKey 设置为Done
    textField_1.returnKeyType = UIReturnKeyDone;
    
    // 通过手势 点击背景 关闭键盘
    UITapGestureRecognizer* singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(closeKeyboard)];
    [self.view addGestureRecognizer:singleTap];
}

#pragma mark - 关闭键盘
// 方法1
- (void)closeKeyboard {
    
    NSArray* subViews = [self.view subviews];
    for (id obj in subViews) {
        if ([obj isKindOfClass:[UITextField class]]) {
//            UITextField* theTextField = (UITextField*)obj;
            if ([obj isFirstResponder]) {
                [obj resignFirstResponder];
            }
        }
    }
}
// 方法2
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == textField_1) {
        [textField resignFirstResponder];
    }
    return YES;
}
// 方法3
- (void)textFieldDidEndEditing:(id)sender{
    
    [sender resignFirstResponder];
}

// 方法4
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"方法4");
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
