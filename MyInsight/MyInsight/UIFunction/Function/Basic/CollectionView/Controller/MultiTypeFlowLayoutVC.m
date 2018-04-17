//
//  MultiTypeFlowLayoutVC.m
//  MyInsight
//
//  Created by SongMenglong on 2018/4/17.
//  Copyright © 2018年 SongMenglong. All rights reserved.
//

#import "MultiTypeFlowLayoutVC.h"
#import <Masonry.h> // 代码约束布局
// 三种布局方式
#import "MIGirdLayout.h"
#import "MILineLayout.h"
#import "MICircleLayout.h"

@interface MultiTypeFlowLayoutVC ()<UICollectionViewDelegate, UICollectionViewDataSource>
// 集合view
@property (nonatomic, strong) UICollectionView *collectionView;
// 图片数组
@property (nonatomic, strong) NSMutableArray<UIImage *> *imagesArray;
//

@end

@implementation MultiTypeFlowLayoutVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"多种布局方式";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self creatCollectionView];
}

// 创建CollectionView
- (void)creatCollectionView {
    // 定义flowlayout
    UICollectionViewLayout *lineFlowLayout = [[MICircleLayout alloc] init];
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:lineFlowLayout];
    [self.view addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
       // 代码约束布局
    }];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    // 注册cell
}

#pragma mark - 实现
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

// 生成item
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    return NULL;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"lalalalal");
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
