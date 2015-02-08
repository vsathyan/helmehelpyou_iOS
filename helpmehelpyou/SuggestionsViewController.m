//
//  SuggestionsViewController.m
//  helpmehelpyou
//
//  Created by Vineet Sathyan on 2/7/15.
//  Copyright (c) 2015 MYH. All rights reserved.
//

#import "SuggestionsViewController.h"
#import "SAMGradientView.h"

@interface SuggestionsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *suggestionText;
@property (nonatomic, weak) IBOutlet SAMGradientView *gradientView;
@property (nonatomic, weak) IBOutlet UIScrollView *scrollView;

@property (nonatomic, strong) NSArray* deStressingArray;
@property (nonatomic, strong) NSArray* gettingStuffDoneArray;


@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UIButton *button3;
@property (weak, nonatomic) IBOutlet UIButton *button4;
@property (weak, nonatomic) IBOutlet UIButton *button5;
- (IBAction)changedSegment:(id)sender;

- (IBAction)clickedSuggestion:(id)sender;


@end

@implementation SuggestionsViewController

- (void)viewDidLoad {
    self.title = @"Examples";
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:NO];
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:198.0f/255.0f green:68.0f/255.0f  blue:252.0f/255.0f  alpha:1]];
    self.navigationController.navigationBar.translucent = NO;
    // Do any additional setup after loading the view from its nib.
    self.gradientView.gradientColors = @[[UIColor colorWithRed:198.0f/255.0f green:68.0f/255.0f  blue:252.0f/255.0f  alpha:1] , [UIColor colorWithRed:88.0f/255.0f green:86.0f/255.0f  blue:214.0f/255.0f  alpha:1]];
    //[self.scrollView addSubview:self.gradientView];
    
    NSString *suggestionString= @"It can be anything that helps you manage or reduce stress. \n \n Some things can help us deal with stress we can't avoid. Other things can help us avoid stress in the first place by tacking a problem or getting stuff done. \n \n See what the community is doing. Try one of these:";
    
    self.deStressingArray = @[@"take 5 deep breaths" ,
                      @"call or visit my best firend",
                      @"listen to my favorite song",
                      @"go for a walk or exercise",
                      @"play with my pet for 10min"
                       ];
    
    self.gettingStuffDoneArray = @[@"go to my doctor's appointment" ,
                              @"set up automatic payment for 1 bill",
                              @"learn how to set up reminders on my phone",
                              @"spend 10min looking up info on.",
                              @"ask my partner to take care of the laundry"
                              ];
    
    [self.suggestionText setText:suggestionString];
    
    [self setDestressing];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)setDestressing
{
    [self.button1 setTitle:self.deStressingArray[0] forState:UIControlStateNormal];
    [self.button2 setTitle:self.deStressingArray[1] forState:UIControlStateNormal];
    [self.button3 setTitle:self.deStressingArray[2] forState:UIControlStateNormal];
    [self.button4 setTitle:self.deStressingArray[3] forState:UIControlStateNormal];
    [self.button5 setTitle:self.deStressingArray[4] forState:UIControlStateNormal];
}

-(void)setGettingStuffDone
{
    [self.button1 setTitle:self.gettingStuffDoneArray[0] forState:UIControlStateNormal];
    [self.button2 setTitle:self.gettingStuffDoneArray[1] forState:UIControlStateNormal];
    [self.button3 setTitle:self.gettingStuffDoneArray[2] forState:UIControlStateNormal];
    [self.button4 setTitle:self.gettingStuffDoneArray[3] forState:UIControlStateNormal];
    [self.button5 setTitle:self.gettingStuffDoneArray[4] forState:UIControlStateNormal];
}


- (IBAction)changedSegment:(id)sender {
    UISegmentedControl *segControll = (UISegmentedControl *)sender;
    if (segControll.selectedSegmentIndex == 0)
    {
        [self setDestressing];
    }
    else
    {
        [self setGettingStuffDone];
    }
}

- (IBAction)clickedSuggestion:(id)sender {
   UIButton *button = (UIButton *)sender;
    
    if ([self.delegate respondsToSelector:@selector(suggested:)])
    {
        [self.delegate suggested:button.titleLabel.text];
        [self.navigationController popViewControllerAnimated:YES];
    }
    
}
@end
