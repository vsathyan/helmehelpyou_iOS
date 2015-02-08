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
@end

@implementation SuggestionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:NO];
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:198.0f/255.0f green:68.0f/255.0f  blue:252.0f/255.0f  alpha:1]];
    self.navigationController.navigationBar.translucent = NO;
    // Do any additional setup after loading the view from its nib.
    self.gradientView.gradientColors = @[[UIColor colorWithRed:198.0f/255.0f green:68.0f/255.0f  blue:252.0f/255.0f  alpha:1] , [UIColor colorWithRed:88.0f/255.0f green:86.0f/255.0f  blue:214.0f/255.0f  alpha:1]];
    //[self.scrollView addSubview:self.gradientView];
    
    NSString *suggestionString= @"It can be anything that helps you manage or reduce stress. \n \n Some things can help us deal with stress we can't avoid. Other things can help us avoid stress in the first place by tacking a problem or getting stuff done. \n \n See what the community is doing. Try one of these:";
    
    [self.suggestionText setText:suggestionString];
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

@end
