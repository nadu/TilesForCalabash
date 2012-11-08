//
//  CustomScrollView.m
//  Data
//
//  Created by Prathab on 15/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CustomScrollView.h"

@implementation CustomScrollView

@synthesize navigation_delegate = _navigation_delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        isCustomizeMode = false;
    }
    return self;
}

-(void) saveReordering {
    
}


-(void) animation:(id) layer {}

#pragma mark -
#pragma mark touchesBegan


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
       
}

- (CALayer *)layerForTouch:(UITouch *)touch {
   
}


- (void)touchBegan:(UITouch *)touch forTile:(PictureButton *)tile {
    
}


- (int)frameIndexForTileIndex:(int)tileIndex {
}

- (void) enterCustomizeMode {
   
}

- (void) exitCustomizeMode {
   
}

#pragma mark -
#pragma mark touchesMoved


- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
}


- (void)moveHeldTileToPoint:(CGPoint)location {
    }


- (void)moveUnheldTilesAwayFromPoint:(CGPoint)location {
    }


- (int)indexOfClosestFrameToPoint:(CGPoint)point {
    int index = 0;
    float minDist = FLT_MAX;
    for (int i = 0; i < [tileForFrame count]; ++i) {
        CGRect frame = tileFrame[i];
        
        float dx = point.x - CGRectGetMidX(frame);
        float dy = point.y - CGRectGetMidY(frame);
        
        float dist = (dx * dx) + (dy * dy);
        if (dist < minDist) {
            index = i;
            minDist = dist;
        }
    }
    return index;
}


#pragma mark -
#pragma mark touchesEnded

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    }


- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
}



/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

@end
