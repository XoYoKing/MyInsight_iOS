//
//  XinHuaVC.m
//  MyInsight
//
//  Created by SongMengLong on 2018/7/30.
//  Copyright © 2018年 SongMenglong. All rights reserved.
//

#import "XinHuaVC.h"
#import <AFNetworking/AFNetworking.h>
#import "HTTPTOOL.h"
#import <Masonry.h>
#import "WordModel.h"
#import "IdiomModel.h"
#import "XieHouYuModel.h"

@interface XinHuaVC ()
// 类型选择button
@property (nonatomic, strong) UIButton *typeButton;
// 发送button
@property (nonatomic, strong) UIButton *sendButton;
// 输入框
@property (nonatomic, strong) UITextField *inputTextField;
// 展示
@property (nonatomic, strong) UITextView *outputTextView;
// 输入的类型
@property (nonatomic, assign) NSInteger typeValue;
// 输入的字符串
@property (nonatomic, strong) NSString *inputStr;

@end

@implementation XinHuaVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"中华新华字典";
 
    // 创建子控件
    [self creatUIViews];
    // 代码约束布局
    [self masonryLayoutSubViews];
    // 处理数据
    //[self handleData];
}

#pragma mark - 创建子控件
- (void)creatUIViews {
    // 类型选择button
    self.typeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:self.typeButton];
    self.typeButton.backgroundColor = [UIColor redColor];
    [self.typeButton addTarget:self action:@selector(typeButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.typeButton setTitle:@"类型" forState:UIControlStateNormal];
    // 发送button
    self.sendButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:self.sendButton];
    self.sendButton.backgroundColor = [UIColor orangeColor];
    [self.sendButton setTitle:@"发送" forState:UIControlStateNormal];
    [self.sendButton addTarget:self action:@selector(sendButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    // 输入的文本框
    self.inputTextField = [[UITextField alloc] init];
    [self.view addSubview:self.inputTextField];
    self.inputTextField.backgroundColor = [UIColor orangeColor];
    self.inputTextField.keyboardType = UIKeyboardTypeDefault; // 键盘类型
    // 输出的文本框
    self.outputTextView = [[UITextView alloc] init];
    [self.view addSubview:self.outputTextView];
    self.outputTextView.backgroundColor = [UIColor purpleColor];
    self.outputTextView.editable = NO;
}

#pragma mark - 类型选择button的动作方法
- (void)typeButtonAction:(UIButton *)button {
    // 弹出选择框
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"提示" message:@"选择发送的类型" preferredStyle:UIAlertControllerStyleAlert];
    // 汉字
    UIAlertAction *wordAction = [UIAlertAction actionWithTitle:@"汉字" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.typeValue = XINHUAWORD;
        [button setTitle:@"汉字" forState:UIControlStateNormal];
    }];
    // 成语
    UIAlertAction *idiomAction = [UIAlertAction actionWithTitle:@"成语" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.typeValue = XINHUAIDIOM;
        [button setTitle:@"成语" forState:UIControlStateNormal];
    }];
    // 歇后语
    UIAlertAction *xiehouyuAction = [UIAlertAction actionWithTitle:@"歇后语" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.typeValue = XINHUAXIEHOUYU;
        [button setTitle:@"歇后语" forState:UIControlStateNormal];
    }];
    // 取消
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        self.typeValue = XINHUAWORD;
        [button setTitle:@"汉字" forState:UIControlStateNormal];
    }];
    
    [alertVC addAction:wordAction];
    [alertVC addAction:idiomAction];
    [alertVC addAction:xiehouyuAction];
    [alertVC addAction:cancelAction];
    
    [self presentViewController:alertVC animated:YES completion:NULL];
}

// 回首键盘
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

#pragma mark - 发送button的动作方法
- (void)sendButtonAction:(UIButton *)button {
    // 回收键盘
    [self.view endEditing:YES];
    // 处理数据
    NSLog(@"发送数据");
    if (self.typeValue < 1) {
        NSLog(@"没有选择类型");
        UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"提示" message:@"没有选择数据类型" preferredStyle:UIAlertControllerStyleAlert];
        // 确认
        UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleCancel handler:NULL];
        [alertVC addAction:confirmAction];
        [self presentViewController:alertVC animated:YES completion:NULL];
        return;
    }
    if (self.inputTextField.text.length < 1) {
        NSLog(@"没有输入内容");
        UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"提示" message:@"没有输入内容" preferredStyle:UIAlertControllerStyleAlert];
        // 确认
        UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleCancel handler:NULL];
        [alertVC addAction:confirmAction];
        [self presentViewController:alertVC animated:YES completion:NULL];
        return;
    }
    // 处理数据
    [self handleData];
}

#pragma mark - 处理数据
- (void)handleData {
    // 中华新华字典数据库 开源API：https://github.com/pwxcoo/chinese-xinhua
    // 请求地址
    NSString *url = @"https://www.pwxcoo.com/dictionary";
    
    // 输入的类型
    NSString *typeKeyStr = [[NSString alloc] init];
    NSString *typeVlaueStr = [[NSString alloc] init];
    
    // 输入的类型
    switch (self.typeValue) {
        case XINHUAWORD:
            // 字
            typeVlaueStr = @"word";
            typeKeyStr = @"word";
            break;
        case XINHUAIDIOM:
            // 成语 直接请求成语
            typeVlaueStr = @"idiom";
            typeKeyStr = @"word";
            // 成语 请求拼音首字母缩写
            
            // typeKeyStr = abbreviation
            break;
        case XINHUAXIEHOUYU:
            // 歇后语
            typeVlaueStr = @"xiehouyu";
            typeKeyStr = @"riddle";
            break;
        default:
            typeVlaueStr = @"xiehouyu";
            typeKeyStr = @"riddle";
            break;
    }
    // 设计body
    NSDictionary *body = @{
             @"type": typeVlaueStr,
             typeKeyStr : self.inputTextField.text, // 值不能为空
             };
    // 进行网络请求
    [HTTPTOOL GETWithURL:url body:body httpHead:nil resoponseStyle:JSON success:^(id result) {
        NSLog(@"%@", result);
        // 处理返回的数据
        [self handleResultArrayData:result];
    } fail:^(NSError *error) {
        NSLog(@"请求失败：%@", error);
    }];
}

#pragma mark - 处理返回的数组数据
- (void)handleResultArrayData:(id)result {
    // 返回的内容数组格式
    NSArray *dataArray = [NSArray arrayWithArray:result];
    // 遍历数组
    for (id item in dataArray) {
        
        
        // 装进model
        if (self.typeValue == XINHUAWORD) {
            // 汉字
            WordModel *wordModel = [WordModel modelWithDictionary:item];
            
            NSLog(@"%@", wordModel.word);
            NSLog(@"%@", wordModel.pinyin);
            NSLog(@"%@", wordModel.radicals);
            NSLog(@"%@", wordModel.oldword);
            NSLog(@"笔画数:%ld", (long)wordModel.strokes); //笔画数
            NSLog(@"%@", wordModel.explanation);
        }
        
        if (self.typeValue == XINHUAIDIOM) {
            // 成语
            IdiomModel *idiomModel = [IdiomModel modelWithDictionary:item];
            
            NSLog(@"%@", idiomModel.derivation);
            NSLog(@"%@", idiomModel.example);
            NSLog(@"%@", idiomModel.explanation);
            NSLog(@"%@", idiomModel.pinyin);
            NSLog(@"%@", idiomModel.word);
            NSLog(@"%@", idiomModel.abbreviation);
        }
        
        if (self.typeValue == XINHUAXIEHOUYU) {
            // 歇后语
            XieHouYuModel *xiehouyuModel = [XieHouYuModel modelWithDictionary:item];
            
            NSLog(@"%@", xiehouyuModel.answer);
            NSLog(@"%@", xiehouyuModel.riddle);
        }
    }
}

#pragma mark - 代码约束布局
- (void)masonryLayoutSubViews {
    // 类型选择button
    [self.typeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(80.0f);
        make.left.equalTo(self.view.mas_left).offset(40.0f);
        make.width.offset(60.0f);
        make.height.offset(40.0f);
    }];
    // 输入的文本框
    [self.inputTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(80.0f);
        make.left.equalTo(self.typeButton.mas_right).offset(10.0f);
        make.right.equalTo(self.sendButton.mas_left).offset(-10.0f);
        make.height.offset(40.0f);
    }];
    // 发送button
    [self.sendButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(80.0f);
        make.right.equalTo(self.view.mas_right).offset(-40.0f);
        make.width.offset(60.0f);
        make.height.offset(40.0f);
    }];
    // 输出的文本框
    [self.outputTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.inputTextField.mas_bottom).offset(20.0f);
        make.left.equalTo(self.view.mas_left).offset(40.0f);
        make.right.equalTo(self.view.mas_right).offset(-40.0f);
        make.bottom.equalTo(self.view.mas_bottom).offset(-40.0f);
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
