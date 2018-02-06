//
//  CollectionViewVC.m
//  MyInsight
//
//  Created by SongMenglong on 2018/2/1.
//  Copyright © 2018年 SongMenglong. All rights reserved.
//

#import "CollectionViewVC.h"
#import "RFQuiltLayout.h" // 瀑布流
#import <Masonry.h>

@interface CollectionViewVC ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UIView *functionView;

@property (nonatomic, strong) UIButton *normalButton;

@property (nonatomic, strong) UIButton *pubuliuButton;

@property (nonatomic, strong) UICollectionView *collectionView;


@end

@implementation CollectionViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"CollectionView";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self creatFunctionView];
    
    //[self creatCollectionView];
    
    [self masonryViewLayout];
}

- (void)creatFunctionView {
    self.functionView = [[UIView alloc] init];
    [self.view addSubview:self.functionView];
    self.functionView.backgroundColor = [UIColor blueColor];
    
    self.normalButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.functionView addSubview:self.normalButton];
    [self.normalButton setTitle:@"普通" forState:UIControlStateNormal];
    [self.normalButton addTarget:self action:@selector(normalButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    self.pubuliuButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.functionView addSubview:self.pubuliuButton];
    self.pubuliuButton.backgroundColor = [UIColor brownColor];
    [self.pubuliuButton setTitle:@"瀑布流" forState:UIControlStateNormal];
    [self.pubuliuButton addTarget:self action:@selector(pubuliuButtonAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)normalButtonAction:(UIButton *)button {
    NSLog(@"普通");
    [self creatCollectionView];
}

- (void)pubuliuButtonAction:(UIButton *)button {
    NSLog(@"瀑布流");
    [self creatCollectionView];
}

- (void)creatCollectionView {
    
    
    
    
    
}

- (void)masonryViewLayout {
    
    [self.functionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(64.0f);
        make.left.equalTo(self.view.mas_left).offset(0.0f);
        make.right.equalTo(self.view.mas_right).offset(0.0f);
        make.height.offset(40.0f);
    }];
    
    [self.normalButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.functionView.mas_top).offset(0.0f);
        make.left.equalTo(self.functionView.mas_left).offset(0.0f);
        make.bottom.equalTo(self.functionView.mas_bottom).offset(0.0f);
        make.right.equalTo(self.pubuliuButton.mas_left).offset(0.0f);
    }];
    
    [self.pubuliuButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.functionView.mas_top).offset(0.0f);
        make.right.equalTo(self.functionView.mas_right).offset(0.0f);
        make.bottom.equalTo(self.functionView.mas_bottom).offset(0.0f);
        make.width.equalTo(self.normalButton.mas_width).multipliedBy(1.0f);
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
