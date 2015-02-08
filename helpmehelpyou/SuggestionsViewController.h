//
//  SuggestionsViewController.h
//  helpmehelpyou
//
//  Created by Vineet Sathyan on 2/7/15.
//  Copyright (c) 2015 MYH. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol SuggestionsDelegate <NSObject>
- (void)suggested:(NSString *)suggestion;
@end


@interface SuggestionsViewController : UIViewController
@property (nonatomic, strong) NSObject<SuggestionsDelegate> *delegate;
@end
