//
//  HorizontalCollectionVC.m
//  MyInsight
//
//  Created by SongMenglong on 2018/4/20.
//  Copyright © 2018年 SongMenglong. All rights reserved.
//

#import "HorizontalCollectionVC.h"

@interface HorizontalCollectionVC ()

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation HorizontalCollectionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"水平流布局";
    
    [self creatCollectionView];
}

- (void)creatCollectionView {
    
    
    //self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:<#(nonnull UICollectionViewLayout *)#>]
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
