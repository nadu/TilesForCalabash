
#import "PicturesViewController.h"
#import "PictureButton.h"

@implementation PicturesViewController

@synthesize scrollView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        BUTTON_WIDTH = 160.0;
        BUTTON_HEIGHT = 160.0;
    }
    return self;
}

- (void)configureScrollView
{

    scrollView=[[CustomScrollView alloc] initWithFrame:CGRectMake(0.0, 30.0, 924.0, 588.0)];
    scrollView.isAccessibilityElement = YES;
    scrollView.accessibilityLabel = @"picturesScrollView";
    [scrollView setNavigation_delegate:self];
    [scrollView setDelegate:self];
    [scrollView setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:scrollView];
    NSMutableArray *button_dict = [[NSMutableArray alloc] initWithObjects:(id)@"",(id)@"",(id)@"", nil];
    NSMutableArray *buttons = [[NSMutableArray alloc] init];
    
    for(int i = 0;i<[button_dict count] ;i++) {
        PictureButton *btn = [[PictureButton alloc] initWithPicModeDict:[button_dict objectAtIndex:i]];
        [self configureButton:btn];
        [buttons addObject:btn];
    }
    
    [self createButtonsInScrollView:buttons];

}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@" scrollViewDidScroll is called, %f %f %f", [[self scrollView] contentOffset].x,  [[self scrollView] contentOffset].y, [[self scrollView] contentSize].height);
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
     NSLog(@" scrollViewDidEndDecelerating is called");
}

-(float) getButtonGapHorizontal {
    
    return (924.0 / [self getMaxColumns]) - [self getButtonWidth]; 
}

-(float) getButtonGapVertical {
    return 30.0;
}

-(float) getButtonWidth {
    return 160.0;
}

-(float) getCaptionRatio {
    return 2.0;
}

-(float) getTextCaptionRatio {
    float ratio = [self getCaptionRatio];
    return ratio;
}

-(float) getPicCaptionRatio {
    float ratio = 2.0 - [self getCaptionRatio];
    if (ratio > 1.0) {
        ratio = 1.1;
    }
    return ratio;
}

-(int) getMaxColumns {
    return 5;
}

- (void)applyTemplateBackgroundOnButton:(PictureButton *)button {
    UIImage *img_normal;
    UIImage *bgImg_normal;
    
    
    img_normal = [UIImage imageNamed:@"templatecustom-normal"];
    bgImg_normal = [img_normal stretchableImageWithLeftCapWidth:10.0 topCapHeight:10.0];
    
    CALayer *imageLayer = [ [CALayer alloc] init];
    [imageLayer setBounds:CGRectMake(0.0,0.0,[self getButtonWidth],[self getButtonWidth])];
    [imageLayer setContents:(id)[bgImg_normal CGImage]];
    [button addSublayer:imageLayer];
}

    
-(void) imageTouch:(id)sender
{
    NSLog(@"Image touched");
}


- (void)configureButton:(PictureButton *) btn {
    //set background
    [self applyTemplateBackgroundOnButton :btn ];
    UIImage *img = [UIImage imageNamed:@"bird_eagle"];
    CALayer *imageLayer = [ [CALayer alloc] init];
    CATextLayer *label = [[CATextLayer alloc] init];

    double ratio = [self getButtonWidth] / 160.0;
    double pic_caption_ratio = 1.0;//[self getPicCaptionRatio];
    double label_caption_ratio = [self getTextCaptionRatio];    
    
    if (pic_caption_ratio != 0 && img != nil)
    {
        [imageLayer setBounds:CGRectMake(20.0, 21.0, 110,129)];
        [imageLayer setContents:(id)[img CGImage]];
    }
    if (label_caption_ratio != 0)
    {
        NSString *label_text = @"button label";
        
        [label setForegroundColor:[UIColor blackColor].CGColor];
        [label setContentsScale:[[UIScreen mainScreen] scale]];
        [label setFontSize:12*ratio*label_caption_ratio];
        [label setString:label_text];
        [label setAlignmentMode:kCAAlignmentCenter];
        [label setBackgroundColor:[UIColor clearColor].CGColor];
        [label setTruncationMode:kCATruncationMiddle];

        [label setWrapped:NO];
        [label setFrame:CGRectMake(-80.0, 48.0,160,44)];
        [btn addSublayer:label];
    }
    
    if(pic_caption_ratio != 0) {
        [btn addSublayer:imageLayer];
    }

}

- (void)createButtonsInScrollView:(NSMutableArray*) picture_buttons {
    
    double button_width = [self getButtonWidth];
    int max_columns = [self getMaxColumns];

    double button_gap_horizontal = [self getButtonGapHorizontal];
    double button_gap_vertical = [self getButtonGapVertical];
    
    double offset_animation = button_width / 2; //the origin is biased toward north-west direction in case of layer
    //added to rectify the offset
    
    //fix columns vary rows
    int max_rows =  ceil([picture_buttons count]*1.0 / max_columns);
    int r, c;
    for (r=0; r<max_rows; r++) {
        for (c=0; c<max_columns; c++) {
            int current_index = r * max_columns + c;
            if(current_index >= [picture_buttons count]) break;
            
            PictureButton *btn = [picture_buttons objectAtIndex:current_index];
            [btn setTileIndex:current_index];
            btn.frame = CGRectMake(offset_animation+ button_gap_horizontal/2 + c*(button_width + button_gap_horizontal),offset_animation + button_gap_vertical/2  + r*(button_width + button_gap_vertical), button_width, button_width);
            [btn setIsAccessibilityElement:YES];
            [btn setAccessibilityLabel:@"Accessibility Label"];
            [scrollView.layer addSublayer:btn];
        }
    }

    
   [scrollView setContentSize:CGSizeMake((button_width+button_gap_horizontal)* max_columns ,  button_gap_vertical/2 + (max_rows)*(button_width + button_gap_vertical)) ];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

-(void) viewDidAppear:(BOOL)animated {
    
    NSLog(@"PicturesView  appeared");
    // check if scrollview is nil
    // happens when viewDidUnload gets called in the background after low memory warning
    if(scrollView == nil){
        NSLog(@"scrollView is empty - recreate it");
        [self configureScrollView];
    }

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self configureScrollView];
}

- (void)viewDidUnload
{
    NSLog(@"PicturesView was unloaded");
    if(scrollView->tileFrame != NULL)
    free(scrollView->tileFrame);
    scrollView = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

@end
