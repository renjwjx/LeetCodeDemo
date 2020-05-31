//
//  LCTitleDetailViewController.m
//  LeetCodeDemo
//
//  Created by jinren on 5/30/20.
//  Copyright © 2020 jinren. All rights reserved.
//

#import "LCTitleDetailViewController.h"
#import "LCDataModal.h"
@interface LCTitleDetailViewController ()
@property (strong, nonatomic) IBOutlet NSLayoutConstraint* detailTVHeight;
@end

@implementation LCTitleDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.titleLabel.text = self.titleStr;
    self.detailLabel.text = [[LCDataModal sharedInstance] titleDescription:self.titleStr];
}

- (void)viewWillAppear:(BOOL)animated
{
    CGFloat height = [self getTextHeightWithStr:self.detailLabel.text withWidth:self.detailLabel.frame.size.width withLineSpacing:5 withFont:14];
    self.detailTVHeight.constant = height;
}

- (IBAction)startAction:(id)sender
{
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(CGFloat)getTextHeightWithStr:(NSString *)str
                     withWidth:(CGFloat)width
               withLineSpacing:(CGFloat)lineSpacing
                      withFont:(CGFloat)font
{
    if (!str || str.length == 0) {
        return 0;
    }
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc]init];
    paraStyle.lineSpacing = lineSpacing;
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc]initWithString:str
                                                                                       attributes:@{NSParagraphStyleAttributeName:paraStyle,NSFontAttributeName:[UIFont systemFontOfSize:font]}];
    
    CGRect rect = [attributeString boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
                                                options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                                context:nil];

    if ((rect.size.height - [UIFont systemFontOfSize:font].lineHeight)  <= lineSpacing){
        if ([self containChinese:str]){
            rect.size.height -= lineSpacing;
        }
    }
    return rect.size.height + lineSpacing;
}

- (BOOL)containChinese:(NSString *)str {
    for(int i=0; i< [str length];i++){
        int a = [str characterAtIndex:i];
        if( a > 0x4e00 && a < 0x9fff){
            return YES;
        }
    }
    return NO;
}

@end
