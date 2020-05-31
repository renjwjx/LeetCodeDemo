//
//  LCDataModal.h
//  LeetCodeDemo
//
//  Created by jinren on 5/31/20.
//  Copyright © 2020 jinren. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LCDataModal : NSObject
@property (strong, nonatomic) NSArray* titleList;
+ (instancetype)sharedInstance;
- (NSString*)titleDescription:(NSString*)title;

@end

NS_ASSUME_NONNULL_END
