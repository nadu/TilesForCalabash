
#import "PictureButton.h"

@implementation PictureButton

@synthesize tileIndex;

-(id) initWithPicModeDict:(id)dict {
    if(self = [super init]) {
        [self setNeedsDisplay];
        self.delegate = self;
        if ([self respondsToSelector:@selector(setContentsScale:)])
        {
            self.contentsScale = [[UIScreen mainScreen] scale];
        }
    }
    return self;
}


- (void)draw {
    
}



#pragma mark -
#pragma mark Draggable animation


- (void)appearDraggable {
    self.opacity = 0.6f;
    [self setValue:[NSNumber numberWithFloat:1.25f] forKeyPath:@"transform.scale"];
    
}


- (void)appearNormal {
    self.opacity = 1.0f;
    [self setValue:[NSNumber numberWithFloat:1.0f] forKeyPath:@"transform.scale"];
}


@end
