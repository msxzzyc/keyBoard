//
//  ZYCKeyboardTool.h
//  键盘处理
//
//  Created by wpzyc on 2017/6/6.
//  Copyright © 2017年 wpzyc. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum {
    ZYCKeyboardToolItemPrevious,
    ZYCKeyboardToolItemNext,
    ZYCKeyboardToolItemDone
    
}ZYCKeyboardToolItem;
@class ZYCKeyboardTool;
@protocol ZYCKeyboardToolDelegate <NSObject>

@optional
//- (void)keyboardToolDidClickPreviousItem:(ZYCKeyboardTool *)tool;
//- (void)keyboardToolDidClickNextItem:(ZYCKeyboardTool *)tool;
//- (void)keyboardToolDidClickDoneItem:(ZYCKeyboardTool *)tool;

- (void)keyboardTool:(ZYCKeyboardTool *)tool didClickItem:(ZYCKeyboardToolItem)item;
@end

@interface ZYCKeyboardTool : UIToolbar
+ (instancetype)tool;

@property (weak, nonatomic,readonly) IBOutlet UIBarButtonItem *previousItem;
@property (weak, nonatomic,readonly) IBOutlet UIBarButtonItem *nextItem;

/** 代理 */
@property(nonatomic,weak)id<ZYCKeyboardToolDelegate> toolbarDelegate;


@end
