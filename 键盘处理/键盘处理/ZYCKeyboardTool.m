//
//  ZYCKeyboardTool.m
//  键盘处理
//
//  Created by wpzyc on 2017/6/6.
//  Copyright © 2017年 wpzyc. All rights reserved.
//

#import "ZYCKeyboardTool.h"

@implementation ZYCKeyboardTool
+ (instancetype)tool
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] firstObject];
    
}
- (IBAction)previous:(id)sender {
    
//    if ([self.delegate respondsToSelector:@selector(keyboardToolDidClickPreviousItem:)] ) {
//        [self.delegate keyboardToolDidClickPreviousItem:self];
//    }
    if ([self.toolbarDelegate respondsToSelector:@selector(keyboardTool:didClickItem:)]) {
        [self.toolbarDelegate keyboardTool:self didClickItem:ZYCKeyboardToolItemPrevious];
    }
}
- (IBAction)next:(id)sender {
//    if ([self.delegate respondsToSelector:@selector(keyboardToolDidClickNextItem:)] ) {
//        [self.delegate keyboardToolDidClickNextItem:self];
//    }

    if ([self.toolbarDelegate respondsToSelector:@selector(keyboardTool:didClickItem:)]) {
        [self.toolbarDelegate keyboardTool:self didClickItem:ZYCKeyboardToolItemNext];
    }
}
- (IBAction)done:(id)sender {
//    if ([self.delegate respondsToSelector:@selector(keyboardToolDidClickDoneItem:)] ) {
//        [self.delegate keyboardToolDidClickDoneItem:self];
//    }
    if ([self.toolbarDelegate respondsToSelector:@selector(keyboardTool:didClickItem:)]) {
        [self.toolbarDelegate keyboardTool:self didClickItem:ZYCKeyboardToolItemDone];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
