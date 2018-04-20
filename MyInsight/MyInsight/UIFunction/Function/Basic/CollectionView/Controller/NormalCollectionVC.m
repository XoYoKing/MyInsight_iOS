//
//  NormalCollectionVC.m
//  MyInsight
//
//  Created by SongMenglong on 2018/4/20.
//  Copyright © 2018年 SongMenglong. All rights reserved.
//

#import "NormalCollectionVC.h"

@interface NormalCollectionVC ()

@end

@implementation NormalCollectionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical; //竖直滑动
    flowLayout.itemSize = CGSizeMake(110, 150);
    flowLayout.headerReferenceSize = CGSizeMake(self.view.bounds.size.width, 100);
    
    
    
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
