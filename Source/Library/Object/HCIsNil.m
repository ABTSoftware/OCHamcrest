//  OCHamcrest by Jon Reid, https://qualitycoding.org
//  Copyright 2021 hamcrest. See LICENSE.txt

#import "HCIsNil.h"

#import <OCHamcrest/HCIsNot.h>


@implementation HCIsNil

- (BOOL)matches:(nullable id)item
{
    return item == nil;
}

- (void)describeTo:(id <HCDescription>)description
{
    [description appendText:@"nil"];
}

@end


id HC_nilValue()
{
    return [[HCIsNil alloc] init];
}

id HC_notNilValue()
{
    return HC_isNot([[HCIsNil alloc] init]);
}
