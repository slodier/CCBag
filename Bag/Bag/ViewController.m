//
//  ViewController.m
//  Bag
//
//  Created by CC on 16/8/19.
//  Copyright © 2016年 CC. All rights reserved.
//

#import "ViewController.h"
#import "XWDragCellCollectionView.h"

@interface ViewController ()<XWDragCellCollectionViewDelegate,XWDragCellCollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong)NSMutableArray *array;

@end

@implementation ViewController
static NSString *cell_id = @"cell";

- (void)viewDidLoad {
    
    NSMutableArray *arr = [NSMutableArray array];
    for (int i = 0; i < 20; i++) {
        [arr addObject:[NSString stringWithFormat:@"%d",i]];
    }
    _array = arr;
    [self layoutUI];

}

- (NSArray *)dataSourceArrayOfCollectionView:(XWDragCellCollectionView *)collectionView {
    return _array;
}

- (void)dragCellCollectionView:(XWDragCellCollectionView *)collectionView newDataArrayAfterMove:(NSArray *)newDataArray {
    newDataArray = _array;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 50;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cell_id forIndexPath:indexPath];
    
    UIColor *color = [UIColor redColor];
    if (indexPath.item >= _array.count) {
        color = [UIColor whiteColor];
    }
    cell.backgroundColor = color;
    return cell;
}

//隐藏状态栏
- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)layoutUI {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize = CGSizeMake(80, 80);
    XWDragCellCollectionView *mainView = [[XWDragCellCollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:flowLayout];
    mainView.arrcyCount = self.array.count;
    mainView.backgroundColor = [UIColor cyanColor];
    mainView.delegate = self;
    mainView.dataSource = self;
    [mainView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:cell_id];
    [self.view addSubview:mainView];
}
@end
