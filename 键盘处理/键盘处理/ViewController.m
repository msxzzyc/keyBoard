//
//  ViewController.m
//  键盘处理
//
//  Created by wpzyc on 2017/6/6.
//  Copyright © 2017年 wpzyc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *addressField;

@end

@implementation ViewController
- (IBAction)previous:(id)sender {
    
}
- (IBAction)next:(id)sender {
    
}
- (IBAction)done:(id)sender {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //加载工具条控件
    UIToolbar *toolbar = [[[NSBundle mainBundle] loadNibNamed:@"ZYCKeyboardTool" owner:self options:nil] firstObject];
    
    //设置工具条
    self.nameField.inputAccessoryView = toolbar;
    self.emailField.inputAccessoryView = toolbar;
    self.addressField.inputAccessoryView = toolbar;
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    [self.view endEditing:YES];
    
}

#pragma mark - <UITextFieldDelegate>
/**
 *当点击键盘右下角的return key时，就会调用这个方法
 */
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == self.nameField) {
        //让emailField成为第一响应者
        [self.emailField becomeFirstResponder];
    } else if(textField == self.emailField) {
        //让addressField成为第一响应者
        [self.addressField becomeFirstResponder];
    }else{
        [self.view endEditing:YES];
//        [textField resignFirstResponder];
    }
    
    
    return YES;
}

@end
