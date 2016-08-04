//
//  TextViewPlaceHolder.h
//  TextPlaceHolder
//


#import <UIKit/UIKit.h>

@interface YSTextView : UITextView
{
    NSDictionary *_placeholderAttributes;
}
// 默认是空， 默认颜色是 gray
@property(copy,nonatomic)     NSString *placeholder;
@property (strong, nonatomic) UIColor *placeholderColor;
// placeholder的属性字典 默认显示一行
@property (strong, nonatomic) NSDictionary *placeholderAttributes;
@property (assign, nonatomic) NSInteger     placeholderNumberOfLine;

@end
