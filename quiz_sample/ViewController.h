//
//  ViewController.h
//  quiz_sample
//
//  Created by Shinya Hirai on 2015/09/02.
//  Copyright (c) 2015年 Shinya Hirai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
// 回答数表示用
@property (weak, nonatomic) IBOutlet UILabel *counterLabel;

@property (weak, nonatomic) IBOutlet UILabel *totalNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;

@property (weak, nonatomic) IBOutlet UIButton *answerAButton;
- (IBAction)tapABtn:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *answerBButton;
- (IBAction)tapBBtn:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *correctAnswerLabel;
@property (weak, nonatomic) IBOutlet UILabel *incorrectAnswerLabel;

@end

