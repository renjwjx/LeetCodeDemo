//
//  LCDataModal.m
//  LeetCodeDemo
//
//  Created by jinren on 5/31/20.
//  Copyright © 2020 jinren. All rights reserved.
//

#import "LCDataModal.h"
@interface LCDataModal()
@property (strong, nonatomic) NSDictionary<NSString*, NSString*>* titleDetailDic;

@end


@implementation LCDataModal


+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    static LCDataModal* sharedLCDataModal = nil;
    if (!sharedLCDataModal) {
        dispatch_once(&onceToken, ^{
            NSLog(@"create LCDataModal");
            sharedLCDataModal = [[LCDataModal alloc] init];
        });
    }
    return sharedLCDataModal;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.titleDetailDic = @{
            @"两数之和" : @"给定一个整数数组nums 和一个目标值target，请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。你可假设每种输入只会对应一个答案。但是，数组中同一个元素不能使用两遍。",
                  @"整数反转" : @"给出一个 32 位的有符号整数，你需要将这个整数中每位上的数字进行反转.输入: 123 输出: 321"};
    }
    return self;
}

- (NSArray *)titleList
{
    return [self.titleDetailDic allKeys];
}

- (NSString *)titleDescription:(NSString *)title
{
    if (title) {
        return self.titleDetailDic[title];
    } else {
        NSLog(@"title(%@) is nil", title);
        return @"";
    }
    
}

@end
