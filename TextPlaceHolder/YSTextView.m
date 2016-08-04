//
//  TextViewPlaceHolder.m
//  TextPlaceHolder
//


#import "YSTextView.h"

@implementation YSTextView

- (void)awakeFromNib{
    [super awakeFromNib];
    [self addNotification];
    [self initData];
}
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addNotification];
        [self initData];
    }
    return self;
}

- (void)addNotification{

    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textDidChange) name:UITextViewTextDidChangeNotification object:nil];
}

- (void)initData{
    _placeholderNumberOfLine = 1;
    _placeholderColor        = [UIColor grayColor];
    
}

- (void)textDidChange{
    [self setNeedsDisplay];
}

- (void)setPlaceholder:(NSString *)placeholder{
    _placeholder = placeholder;
    [self setNeedsDisplay];
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor{
    _placeholderColor = placeholderColor;
    [self setNeedsDisplay];
}

- (void)setPlaceholderAttributes:(NSDictionary *)placeholderAttributes{

    _placeholderAttributes = placeholderAttributes;
    if (![_placeholderAttributes objectForKey:NSParagraphStyleAttributeName]) {
        NSMutableDictionary *newPlaceholderAttributes = [_placeholderAttributes mutableCopy];
        [newPlaceholderAttributes setObject:[self defaultParagraphStyle] forKey:NSParagraphStyleAttributeName];
        _placeholderAttributes = newPlaceholderAttributes;
    }

    [self setNeedsDisplay];
}
- (NSDictionary *)placeholderAttributes{
    if (!_placeholderAttributes) {
        _placeholderAttributes   = @{NSForegroundColorAttributeName:_placeholderColor,NSFontAttributeName:self.font,NSParagraphStyleAttributeName:[self defaultParagraphStyle]};
    }
    return _placeholderAttributes;
}
- (void)setPlaceholderNumberOfLine:(NSInteger)placeholderNumberOfLine{
    _placeholderNumberOfLine = placeholderNumberOfLine;
    if (!_placeholderNumberOfLine) {
        _placeholderNumberOfLine = NSIntegerMax;
    }
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect{
    if (!self.text.length) {

        [_placeholder drawInRect:(CGRect){{8, 8},{self.frame.size.width - 16,self.font.lineHeight*self.placeholderNumberOfLine}} withAttributes:self.placeholderAttributes];
    }

}

- (NSMutableParagraphStyle *)defaultParagraphStyle{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    if (self.placeholderNumberOfLine != 1) {
        paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    }
    else{
        paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;
    }
    return paragraphStyle;
}

- (void)dealloc{
    
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UITextViewTextDidChangeNotification object:nil];
}

@end
