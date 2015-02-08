//
//  HomeViewController.h
//  helpmehelpyou
//
//  Created by Vineet Sathyan on 2/7/15.
//  Copyright (c) 2015 MYH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController

@property (nonatomic, strong) NSString *todaysGoal;
@property (weak, nonatomic) IBOutlet UIButton *helpButton;
@property (weak, nonatomic) IBOutlet UIButton *cantDoMuchButton;
@property (weak, nonatomic) IBOutlet UIButton *suggestionButton;


- (IBAction)submitClicked:(id)sender;

@end
