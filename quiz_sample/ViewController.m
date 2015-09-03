//
//  ViewController.m
//  quiz_sample
//
//  Created by Shinya Hirai on 2015/09/02.
//  Copyright (c) 2015年 Shinya Hirai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    // 質問本文用
    NSMutableArray *_questionAry;
    
    // 回答ボタン用
    NSMutableDictionary *_answerDict;
    
    // _answerDcitのキーのみ
    NSMutableArray *_answerKey;
    
    // 質問の総数用
    int _countAllQuestion;
    
    // 回答した回数を保持するためのカウント
    int _countAnswer;
    
    // 正解：不正解のカウント
    int _correctCount;
    int _incorrectCount;
    
    // 質問の表示・削除用のカウント
    // 今回は固定で0を入れているが、ランダムな数字に変えればランダムで質問を出し削除が可能。
    int _selectCount;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 可変配列の初期化と配列データの代入
    _questionAry = [[NSMutableArray alloc] init];
    NSArray *qAry = @[@"ほげとは",@"ふがとは",@"もげとは",@"ぐがとは",@"もぬとは"];
    _questionAry = [NSMutableArray arrayWithArray:qAry];
    
    // 可変辞書の初期化と辞書データの代入
    _answerDict = [[NSMutableDictionary alloc] init];
    NSDictionary *aDict = @{@"回答1":@"正解",@"回答2":@"不正解"};
    _answerDict = [NSMutableDictionary dictionaryWithDictionary:aDict];
    
    // キーのみ取得
    NSArray *keyAry = [_answerDict allKeys];
    _answerKey =  [NSMutableArray arrayWithArray:keyAry];
    
    // ボタンのタイトル設定
    [self.answerAButton setTitle:keyAry[0] forState:UIControlStateNormal];
    [self.answerBButton setTitle:keyAry[1] forState:UIControlStateNormal];
    
    // クイズの数を表示用の変数に渡す
    _countAllQuestion = (int)_questionAry.count;
    
    // 初期化
    _countAnswer = 1;
    _selectCount = 0;
    _correctCount = 0;
    _incorrectCount = 0;
    
    // 全質問の合計値表示
    self.totalNumberLabel.text = [NSString stringWithFormat:@"%lu",(unsigned long)_countAllQuestion];
    
    // 回答数の初期値表示
    self.counterLabel.text = [NSString stringWithFormat:@"%lu",(unsigned long)_countAnswer];
    
    // 質問表示
    self.questionLabel.text = _questionAry[_selectCount];
    
    // 表示した質問が要らなくなるので削除
    [_questionAry removeObject:_questionAry[_selectCount]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tapABtn:(id)sender {
    
    // senderからボタンの情報を呼び出す
    UIButton *btn = (UIButton *)sender;
    NSString *title = btn.currentTitle;

    // ボタンのタイトルを引数にしてselectAnswerメソッドを呼び出す
    [self selectAnswer:title];
}

- (IBAction)tapBBtn:(id)sender {
    
    // senderからボタンの情報を呼び出す
    UIButton *btn = (UIButton *)sender;
    NSString *title = btn.currentTitle;
    
    // ボタンのタイトルを引数にしてselectAnswerメソッドを呼び出す
    [self selectAnswer:title];
}

- (void)selectAnswer:(NSString *)btnTitle {
    // 回答された際にカウントする
    _countAnswer++;
    
    // 選択したボタンのタイトルを利用して正解かどうかなどの処理を書く
    // 引数のbtnTitleには、このメソッドを呼び出した時に引数で渡したボタンのtitleを使ったり
    NSLog(@"選択されたボタンのタイトル = %@", btnTitle);
    NSString *answer = _answerDict[btnTitle];
    NSLog(@"選択したボタンが正解かどうか = %@", answer);
    if ([answer isEqualToString:@"正解"]) {
        _correctCount++;
        self.correctAnswerLabel.text = [NSString stringWithFormat:@"%d",_correctCount];
    } else {
        _incorrectCount++;
        self.incorrectAnswerLabel.text = [NSString stringWithFormat:@"%d",_incorrectCount];
    }K
    
    
    // クイズが続く場合は質問用配列などの中身を確認
    NSLog(@"=======================");
    
    for (int i = 0; i < _questionAry.count; i++) {
        NSLog(@"残りクイズ = %@", _questionAry[i]);
    }
    
    if (_countAnswer == _countAllQuestion + 1) {
        // もし質問の総数+1と回答の総数が一致すればクイズを終了
        NSLog(@"クイズ終了");
        
        // ここに各々の初期化処理を書く
        // 画面を戻したり変数を戻したり
        
        // 今回は簡易でボタンを隠す
        self.answerAButton.hidden = YES;
        self.answerBButton.hidden = YES;
    } else {
        // 画面をリロードする
        // 実際には次の値をラベルやボタンに表示させている
        self.counterLabel.text = [NSString stringWithFormat:@"%lu",(unsigned long)_countAnswer];
        self.questionLabel.text = _questionAry[_selectCount];
        
        // 表示して要らなくなった質問を削除
        [_questionAry removeObject:_questionAry[_selectCount]];
    }
}
@end
