//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2015 hamcrest.org. See LICENSE.txt

#import "HCCollect.h"

#import "HCWrapInMatcher.h"

static id passThrough(id value)
{
    return value;
}

NSArray * HCCollectItems(id item, va_list args)
{
    return HCCollectWrappedItems(item, args, passThrough);
}

NSArray * HCCollectMatchers(id item, va_list args)
{
    return HCCollectWrappedItems(item, args, HCWrapInMatcher);
}

NSArray * HCCollectWrappedItems(id item, va_list args, id (*wrap)(id))
{
    NSMutableArray *list = [NSMutableArray arrayWithObject:wrap(item)];

    id nextItem = va_arg(args, id);
    while (nextItem)
    {
        [list addObject:wrap(nextItem)];
        nextItem = va_arg(args, id);
    }

    return list;
}

NSArray * HCWrapIntoMatchers(NSArray *items)
{
    NSMutableArray *matchers = [[NSMutableArray alloc] init];
    for (id item in items)
        [matchers addObject:HCWrapInMatcher(item)];
    return matchers;
}
