//
//  HomeViewController.m
//  helpmehelpyou
//
//  Created by Vineet Sathyan on 2/7/15.
//  Copyright (c) 2015 MYH. All rights reserved.
//

#import "HomeViewController.h"
#import "SAMGradientView.h"
#import "SuggestionsViewController.h"
#import "APIClient.h"
#import "FeedTableViewCell.h"

@interface HomeViewController () <SuggestionsDelegate, UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, weak) IBOutlet SAMGradientView *gradientView;
@property (nonatomic, weak) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@property (weak, nonatomic) IBOutlet UITableView *feedTableView;
@property (nonatomic, strong) FeedTableViewCell *clickableTableViewCell;

@property (nonatomic, strong) NSMutableArray *sampleArray;

- (IBAction)suggestButtonClicked:(id)sender;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //SAMGradientView *gradientView = [[SAMGradientView alloc] initWithFrame:CGRectMake(0, 0, 320, 300)];
    self.gradientView.gradientColors = @[[UIColor colorWithRed:198.0f/255.0f green:68.0f/255.0f  blue:252.0f/255.0f  alpha:1] , [UIColor colorWithRed:88.0f/255.0f green:86.0f/255.0f  blue:214.0f/255.0f  alpha:1]];

    [self registerNibs];
    [APIClient getGoals];
    
    [self.scrollView setContentSize:CGSizeMake(320, 893)];
    
    [self setMultiLineButton:self.helpButton];
    [self setMultiLineButton:self.cantDoMuchButton];
    
    NSDictionary *goal1 = @{ @"title" : @"Today I am going pick up my car",
                             @"when" : @"Emir B. 10 h ago",
                             @"thank" : @"Emir thanked Josee for helping him!",
                             @"comments" : @"4 comments",
                             @"likes" : @"9 likes" };
    
    NSDictionary *goal2 = @{ @"title" : @"Today I am going to sign up for a hackthon",
                             @"when" : @"Adam G. 2 d ago",
                             @"thank" : @"Adam thanked Josee for helping him!",
                             @"comments" : @"6 comments",
                             @"likes" : @"4 likes" };
    NSDictionary *goal3 = @{ @"title" : @"Today I am going to take the day off",
                             @"when" : @"Vineet S. 2 d ago",
                             @"thank" : @"",
                             @"comments" : @"5 comments",
                             @"likes" : @"5 likes" };
    NSDictionary *goal4 = @{ @"title" : @"Today I am going to shovel my driveway",
                             @"when" : @"Kevin M. 3 d ago",
                             @"thank" : @"",
                             @"comments" : @"3 comments",
                             @"likes" : @"3 likes" };
    
    NSArray *goalArray= @[goal1,goal2, goal3, goal4];
    self.sampleArray = [[NSMutableArray alloc] initWithArray:goalArray];
}

-(void)setMultiLineButton:(UIButton *)button
{
    button.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
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

- (IBAction)suggestButtonClicked:(id)sender {
    SuggestionsViewController *suggestVC= [[SuggestionsViewController alloc] initWithNibName:nil bundle:nil];
    suggestVC.delegate = self;
    [self.navigationController pushViewController:suggestVC animated:YES];
}

- (void)suggested:(NSString *)suggestion
{
    self.todaysGoal = suggestion;
    [self.textView setText:suggestion];
}

- (IBAction)submitClicked:(id)sender {
    UIButton *button = (UIButton *)sender;
    self.todaysGoal = self.textView.text;
    NSDictionary *goal = @{ @"title" : self.todaysGoal,
                             @"when" : @"Emir B. just now",
                             @"thank" : @"",
                             @"comments" : @"0 comments",
                             @"likes" : @"0 likes" };
    [self.sampleArray insertObject:goal atIndex:0];
    [self.feedTableView reloadData];
    
}


#pragma mark- UITableViewDelegate
- (void)registerNibs
{
    [self.feedTableView registerNib:[UINib nibWithNibName:@"FeedTableViewCell" bundle:nil] forCellReuseIdentifier:@"feedTableViewCell"];
}

- (FeedTableViewCell *)clickableTableViewCell
{
    if (!_clickableTableViewCell) _clickableTableViewCell = [self.feedTableView dequeueReusableCellWithIdentifier:@"feedTableViewCell"];
    return _clickableTableViewCell;
}

#pragma mark - Table View Delegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FeedTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"feedTableViewCell" forIndexPath:indexPath];
    
    [cell.titleLabel setText:@""];
    
    NSDictionary *goal = self.sampleArray[indexPath.row];
    
    cell.titleLabel.text = goal[@"title"];
    cell.whenLabel.text = goal[@"when"];
    cell.thankLabel.text = goal[@"thank"];
    cell.commentsLabel.text = goal[@"comment"];
    cell.likesLabel.text = goal[@"likes"];
    
    
    [cell.cellImageView setImage:[UIImage imageNamed:@"relaxing"]];
    //[cell.accessoryView setBackgroundColor:[UIColor clearColor]];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.sampleArray count];
}


- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return @" ";
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @" ";
}


@end
