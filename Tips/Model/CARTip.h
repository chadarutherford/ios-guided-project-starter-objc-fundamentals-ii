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
@property NSString *name;
@property double total;
@property int splitCount;
@property double tipPercentage;

- (instancetype) initWithName: (NSString *) name
                        total: (double) total
                   splitCount: (int) splitCount
                tipPercentage: (double) tipPercentage;

@end

NS_ASSUME_NONNULL_END
