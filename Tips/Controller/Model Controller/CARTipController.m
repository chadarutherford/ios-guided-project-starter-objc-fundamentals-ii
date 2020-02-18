//
//  CARTipController.m
//  Tips
//
//  Created by Chad Rutherford on 2/18/20.
//  Copyright © 2020 Chad Rutherford. All rights reserved.
//

#import "CARTipController.h"
#import "CARTip.h"

@interface CARTipController ()

@property (nonatomic) NSMutableArray<CARTip *> *internalTips;



@end

@implementation CARTipController

- (instancetype) init {
    self = [super init];
    if (self) {
        _internalTips = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSArray<CARTip *> *)tips {
    return [self.internalTips copy];
}

- (void) createTipWithName: (NSString *)name
                     total: (double) total
                splitCount: (int) splitCount
             tipPercentage: (double) tipPercentage {
    
    CARTip *tip = [[CARTip alloc]
                   initWithName:name
                   total:total
                   splitCount:splitCount
                   tipPercentage:tipPercentage];
    
    [self.internalTips addObject:tip];
}

@end
