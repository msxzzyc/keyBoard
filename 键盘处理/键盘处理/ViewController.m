//
//  ViewController.m
//  键盘处理
//
//  Created by wpzyc on 2017/6/6.
//  Copyright © 2017年 wpzyc. All rights reserved.
//

#import "ViewController.h"
#import "ZYCKeyboardTool.h"

@interface ViewController ()<UITextFieldDelegate,ZYCKeyboardToolDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *addressField;

/**所有的文本框数组*/
@property (strong, nonatomic)NSArray *fields;

/**工具条*/
@property (weak, nonatomic)ZYCKeyboardTool *toolbar;
@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.fields = @[self.nameField,self.emailField,self.addressField];
    
    //加载工具条控件
    ZYCKeyboardTool *toolbar = [ZYCKeyboardTool tool];
    
    toolbar.toolbarDelegate = self;
    
    self.toolbar = toolbar;
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
/**
 *键盘弹出时，就会调用这个方法
 */
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    
    NSInteger currentIndex = 0;
    
    currentIndex = [self.fields indexOfObject:textField];
    
    self.toolbar.previousItem.enabled = (currentIndex != 0);
    self.toolbar.nextItem.enabled = (currentIndex != self.fields.count -1);
    
    return YES;
}

#pragma mark - ZYCKeyboardToolDelegate

//- (void)keyboardToolDidClickPreviousItem:(ZYCKeyboardTool *)tool
//{
//    NSInteger currentIndex = 0;
//    
//    for (UIView *view in self.view.subviews) {
//        if ([view isFirstResponder]) {
//            currentIndex = [self.fields indexOfObject:view];
//            
//        }
//    }
//    currentIndex--;
//    [self.fields[currentIndex] becomeFirstResponder];
//    
//    self.toolbar.previousItem.enabled = (currentIndex != 0);
//}
//- (void)keyboardToolDidClickNextItem:(ZYCKeyboardTool *)tool
//{
//    NSInteger currentIndex = 0;
//    
//    for (UIView *view in self.view.subviews) {
//        if ([view isFirstResponder]) {
//            currentIndex = [self.fields indexOfObject:view];
//            
//        }
//    }
//    currentIndex++;
//    [self.fields[currentIndex] becomeFirstResponder];
//    
//    self.toolbar.nextItem.enabled = (currentIndex != self.fields.count -1);
//}
//- (void)keyboardToolDidClickDoneItem:(ZYCKeyboardTool *)tool
//{
//    
//    [self.view endEditing:YES];
//    
//}

- (void)keyboardTool:(ZYCKeyboardTool *)tool didClickItem:(ZYCKeyboardToolItem)item
{
    if (item == ZYCKeyboardToolItemPrevious) {
        NSInteger currentIndex = 0;
        
            for (UIView *view in self.view.subviews) {
                if ([view isFirstResponder]) {
                    currentIndex = [self.fields indexOfObject:view];
        
                }
            }
            currentIndex--;
            [self.fields[currentIndex] becomeFirstResponder];
            
            self.toolbar.previousItem.enabled = (currentIndex != 0);
        
    }else if (item == ZYCKeyboardToolItemNext){
        NSInteger currentIndex = 0;
        
            for (UIView *view in self.view.subviews) {
                if ([view isFirstResponder]) {
                    currentIndex = [self.fields indexOfObject:view];
        
                }
            }
            currentIndex++;
            [self.fields[currentIndex] becomeFirstResponder];
        
            self.toolbar.nextItem.enabled = (currentIndex != self.fields.count -1);

        
    }else if (item == ZYCKeyboardToolItemDone){
        
        [self.view endEditing:YES];
    }
    
}
@end
