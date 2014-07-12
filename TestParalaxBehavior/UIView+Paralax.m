//
//  UIView+Paralax.m
//  TestParalaxBehavior
//
//  Created by Alexander on 12.07.14.
//  Copyright (c) 2014 Alexander. All rights reserved.
//

#import "UIView+Paralax.h"
#import <objc/runtime.h>

@implementation UIView (Paralax)

static char k = 'c';
- (void)setParalaxSpeed:(CGFloat)paralaxSpeed
{
    objc_setAssociatedObject(self, &k, @(paralaxSpeed), OBJC_ASSOCIATION_RETAIN);
}

- (CGFloat)paralaxSpeed
{
    return [objc_getAssociatedObject(self, &k) floatValue];
}

@end
