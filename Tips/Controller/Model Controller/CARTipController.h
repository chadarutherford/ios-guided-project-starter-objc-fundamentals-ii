//
//  CARTipController.h
//  Tips
//
//  Created by Chad Rutherford on 2/18/20.
//  Copyright © 2020 Chad Rutherford. All rights reserved.
//

#import <Foundation/Foundation.h>
// Forward declare a class
@class CARTip;

NS_ASSUME_NONNULL_BEGIN

@interface CARTipController : NSObject

@property (nonatomic, readonly) NSArray<CARTip *> *tips;

- (void) createTipWithName: (NSString *)name
                     total: (double) total
                splitCount: (int) splitCount
             tipPercentage: (double) tipPercentage;

@end

NS_ASSUME_NONNULL_END
