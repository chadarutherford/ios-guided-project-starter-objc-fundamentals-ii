//
//  CARTip.h
//  Tips
//
//  Created by Chad Rutherford on 2/18/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CARTip : NSObject

// public properties
@property (nonatomic, readonly, copy) NSString *name;
@property (nonatomic, readonly) double total;
@property (nonatomic, readonly) int splitCount;
@property (nonatomic, readonly) double tipPercentage;

- (instancetype) initWithName: (NSString *) name
                        total: (double) total
                   splitCount: (int) splitCount
                tipPercentage: (double) tipPercentage;

@end

NS_ASSUME_NONNULL_END
