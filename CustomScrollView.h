//
//  CustomScrollView.h
//  Data
//
//  Created by Prathab on 15/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PictureButton.h"
#import <QuartzCore/CAGradientLayer.h>
#import "CALayer+Additions.h"
#import <QuartzCore/QuartzCore.h>

@protocol CustomScrollViewProtocol <NSObject>

-(BOOL) isEditMode;
-(BOOL) isCustomizeMode;
-(void) imageTouch:(id)sender;

@end

@interface CustomScrollView : UIScrollView <UIScrollViewDelegate> {
    //animation specific
@public
    CGRect         *tileFrame;
    NSMutableArray *tileForFrame;
    PictureButton  *heldTile;
    int            heldFrameIndex;
    CGPoint        heldStartPosition;
    CGPoint        touchStartLocation;
    BOOL           isMoved;
    BOOL           tileTapped;
    BOOL           isCustomizeMode;
}

@property(nonatomic, unsafe_unretained) id<CustomScrollViewProtocol> navigation_delegate;
@property(nonatomic, unsafe_unretained) id<UIScrollViewDelegate> delegate;

-(void) saveReordering;

- (void) enterCustomizeMode;
- (void) exitCustomizeMode;

@end
