//
//  Paralax.m
//  TestParalaxBehavior
//
//  Created by Alexander on 12.07.14.
//  Copyright (c) 2014 Alexander. All rights reserved.
//

#import "Paralax.h"
#import "UIView+Paralax.h"

@interface Paralax() <UIScrollViewDelegate>
{
    NSMutableArray *positions;
    CGPoint beginOffset;
}
@end

@implementation Paralax

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    positions = [NSMutableArray new];
    for(UIView *v in self.elements) {
        NSValue *val = [NSValue valueWithCGPoint:v.center];
        [positions addObject:val];
    }
    beginOffset = scrollView.contentOffset;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    CGPoint changeOffset = CGPointMake(scrollView.contentOffset.x - beginOffset.x,
                                       scrollView.contentOffset.y - beginOffset.y);
    NSInteger i = 0;
    for(UIView *v in self.elements) {
        CGPoint beginCenter = [positions[i] CGPointValue];
        // elements on scroll already have speed 1.0
        CGFloat power = v.paralaxSpeed - 1.0;
        v.center = CGPointMake(beginCenter.x - changeOffset.x * power,
                               beginCenter.y - changeOffset.y * power);
        i++;
    }
}

@end
