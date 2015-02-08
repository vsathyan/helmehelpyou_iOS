//
//  HomeViewController.m
//  helpmehelpyou
//
//  Created by Vineet Sathyan on 2/7/15.
//  Copyright (c) 2015 MYH. All rights reserved.
//

#import "HomeViewController.h"
#import "SAMGradientView.h"
#import "APIClient+login.h"

@interface HomeViewController ()
@property (nonatomic, weak) IBOutlet SAMGradientView *gradientView;
@property (nonatomic, weak) IBOutlet UIScrollView *scrollView;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //SAMGradientView *gradientView = [[SAMGradientView alloc] initWithFrame:CGRectMake(0, 0, 320, 300)];
    self.gradientView.gradientColors = @[[UIColor colorWithRed:198.0f/255.0f green:68.0f/255.0f  blue:252.0f/255.0f  alpha:1] , [UIColor colorWithRed:88.0f/255.0f green:86.0f/255.0f  blue:214.0f/255.0f  alpha:1]];
    [self.scrollView setContentSize:CGSizeMake(320, 1200)];
    //[self.view addSubview:self.gradientView];
    
    NSDictionary *sampleUser = @{ @"first_name" : @"greatest" ,
                                  @"last_name" : @"ever" ,
                                  @"device_id" : @"6666"
                                  };
    
    [APIClient getUser:@"4444" block:^(id sessionObject, NSError *error) {
        NSLog(@"%@", sessionObject);
    }];
    
    [APIClient createUser:sampleUser block:^(id sessionObject, NSError *error) {
        if (sessionObject)
        {
            NSLog(@"%@", sessionObject);
            
        }
    }];
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
