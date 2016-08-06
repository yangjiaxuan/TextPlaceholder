//
//  ViewController.m
//  TextPlaceHolder
//


#import "ViewController.h"
#import "YSTextView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet YSTextView *textViewXIB;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _textViewXIB.placeholder = @"这是XIBplaceholder这是XIBplaceholder这是XIBplaceholder";
//    _textViewXIB.placeholderNumberOfLine = 0;
//    _textViewXIB.placeholderColor = [UIColor redColor];
}

- (void)addTextView{
    YSTextView *textF = [[YSTextView alloc]initWithFrame:(CGRect){{50,100},{275,80}}];
    textF.layer.borderColor = [UIColor purpleColor].CGColor;
    textF.layer.borderWidth = 1;
    textF.placeholder = @"这是placeholder这是placeholder这是placeholder";
    textF.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:textF];
    
    textF.placeholderAttributes = @{NSForegroundColorAttributeName:[UIColor redColor],NSFontAttributeName:[UIFont systemFontOfSize:20]};
    textF.placeholderNumberOfLine = 0;
}

@end
