//
//  PictureButton.h
//  Avaz
//
//  Created by Ajit Narayanan on 15/03/12.
//  Copyright (c) 2012 Techtinium Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/CAGradientLayer.h>
#import "CALayer+Additions.h"



@interface PictureButton : CALayer {
    int tileIndex; //index of the picture with in the screen
    
}


@property (nonatomic) int tileIndex;

-(PictureButton*) initWithPicModeDict:(id)dict;

- (void)draw;

- (void)appearDraggable;

- (void)appearNormal;

@end
