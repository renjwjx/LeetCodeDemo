//
//  LCTitleDetailViewController.h
//  LeetCodeDemo
//
//  Created by jinren on 5/30/20.
//  Copyright © 2020 jinren. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LCTitleDetailViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel* titleLabel;
@property (strong, nonatomic) IBOutlet UITextView* detailLabel;
@property (strong, nonatomic) NSString* titleStr;

@end

NS_ASSUME_NONNULL_END
