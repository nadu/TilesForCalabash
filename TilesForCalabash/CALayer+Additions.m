//
//  CALayer+Additions.m
//  Data
//
//  Created by Prathab on 15/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//


#import "CALayer+Additions.h"


@implementation CALayer (Additions)


- (void)moveToFront {
    CALayer *superlayer = self.superlayer;
    [self removeFromSuperlayer];
    [superlayer addSublayer:self];
}


@end
