//
//  PicturesViewController.h
//  Avaz
//
//  Created by Ajit Narayanan on 14/03/12.
//  Copyright (c) 2012 Techtinium Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PictureButton.h"
#import "CustomScrollView.h"


@interface PicturesViewController : UIViewController <CustomScrollViewProtocol, UIScrollViewDelegate>
{
    double BUTTON_WIDTH;
    double BUTTON_HEIGHT;
}


@property (nonatomic, retain) CustomScrollView *scrollView;

- (void) createButtonsInScrollView:(NSMutableArray*) picture_buttons;
- (void) configureScrollView;
- (void) configureButton:(PictureButton *)btn;
- (void) applyTemplateBackgroundOnButton:(PictureButton *)button;

@end
