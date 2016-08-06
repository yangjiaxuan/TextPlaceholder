//
//  TextViewPlaceHolder.h
//  TextPlaceHolder
//


#import <UIKit/UIKit.h>

IB_DESIGNABLE

@interface YSTextView : UITextView
{
    NSDictionary *_placeholderAttributes;
}
// 默认是空， 默认颜色是 gray
@property(copy,nonatomic) IBInspectable     NSString *placeholder;
@property (strong, nonatomic) IBInspectable UIColor  *placeholderColor;

// 默认显示一行
@property (assign, nonatomic) IBInspectable NSInteger placeholderNumberOfLine;

// placeholder的属性字典
@property (strong, nonatomic) NSDictionary *placeholderAttributes;

@end
