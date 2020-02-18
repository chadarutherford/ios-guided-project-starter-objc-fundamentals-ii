//
//  CARTip.m
//  Tips
//
//  Created by Chad Rutherford on 2/18/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import "CARTip.h"

@implementation CARTip

- (instancetype) initWithName:(NSString *)name
                        total:(double)total
                   splitCount:(int)splitCount
                tipPercentage:(double)tipPercentage {
    self = [super init];
    if (self) {
        _name = [name copy];
        _total = total;
        _splitCount = splitCount;
        _tipPercentage = tipPercentage;
    }
    return self;
}

@end
