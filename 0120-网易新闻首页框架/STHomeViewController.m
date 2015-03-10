//
//  STHomeViewController.m
//  0120-网易新闻首页框架
//
//  Created by 李松涛 on 15-1-30.
//  Copyright (c) 2015年 lst. All rights reserved.
//

#import "STHomeViewController.h"
#import "STHeadlineViewController.h"
#import "STTitleLabel.h"
#import "UIView+Frame.h"
@interface STHomeViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *titleScrollView;
@property (weak, nonatomic) IBOutlet UIScrollView *contentScrollView;

@end

@implementation STHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //不让系统将scrollview顶下去64的高度
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self setupChildVces];
    
    [self setupTitleScrollView];
    
    //设置默认控制器
    STHeadlineViewController *vc = self.childViewControllers[0];
    vc.view.frame = self.contentScrollView.bounds;
    [self.contentScrollView addSubview:vc.view];
    //设置滚动范围
    CGFloat contentSizeW = self.childViewControllers.count * [UIScreen mainScreen].bounds.size.width;
    self.contentScrollView.contentSize = CGSizeMake(contentSizeW, 0);
    self.contentScrollView.pagingEnabled = YES;
    self.contentScrollView.showsHorizontalScrollIndicator = NO;
    self.contentScrollView.showsVerticalScrollIndicator = NO;
    self.contentScrollView.bounces = NO;
    
}

- (void)setupTitleScrollView
{
    NSUInteger count = self.childViewControllers.count;
    CGFloat labelW = 90;
    CGFloat labelH = 40;
    CGFloat labelY = 0;
    for (NSUInteger i = 0; i < count; i++) {
        STTitleLabel *label = [[STTitleLabel alloc] init];
        STHeadlineViewController *vc = self.childViewControllers[i];
        if (i == 0) {
            label.font = [UIFont systemFontOfSize:20.0];
            label.textColor = [UIColor redColor];
        }
        label.text = vc.title;
        label.tag = i;
        CGFloat labelX = i * labelW;
        label.frame = CGRectMake(labelX, labelY, labelW, labelH);
        [label addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(labelClick:)]];
        [self.titleScrollView addSubview:label];
    }
    self.titleScrollView.contentSize = CGSizeMake(count * labelW, 0);
    self.titleScrollView.showsHorizontalScrollIndicator = NO;
    self.titleScrollView.showsVerticalScrollIndicator = NO;
}

- (void)labelClick:(UITapGestureRecognizer *)recognizer
{
    STTitleLabel *label = (STTitleLabel *)recognizer.view;
    //contentScrollView的偏移量
    CGFloat offsetX = label.tag * self.contentScrollView.width;
    
    [self.contentScrollView setContentOffset:CGPointMake(offsetX, 0) animated:YES];
}

-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    int index = scrollView.contentOffset.x / scrollView.width;
    
    STHeadlineViewController *vc = self.childViewControllers[index];
    vc.view.frame = self.contentScrollView.bounds;
    [self.contentScrollView addSubview:vc.view];
    //取出对应的label
    STTitleLabel *label = self.titleScrollView.subviews[index];
    //titleScrollView的偏移量
    CGFloat offsetX = label.centerX - self.titleScrollView.width * 0.5;
    CGFloat maxOffsetX = self.titleScrollView.contentSize.width - self.titleScrollView.width;
    if (offsetX < 0) {
        offsetX = 0;
    }else if (offsetX > maxOffsetX)
    {
        offsetX = maxOffsetX;
    }
    [self.titleScrollView setContentOffset:CGPointMake(offsetX, 0) animated:YES];

}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self scrollViewDidEndScrollingAnimation:scrollView];
}

- (void)setupChildVces
{
    STHeadlineViewController *vc0 = [[STHeadlineViewController alloc] init];
    vc0.title = @"头条";
    [self addChildViewController:vc0];
    STHeadlineViewController *vc1 = [[STHeadlineViewController alloc] init];
    vc1.title = @"科技";
    [self addChildViewController:vc1];
    STHeadlineViewController *vc2 = [[STHeadlineViewController alloc] init];
    vc2.title = @"军事";
    [self addChildViewController:vc2];
    STHeadlineViewController *vc3 = [[STHeadlineViewController alloc] init];
    vc3.title = @"政治";
    [self addChildViewController:vc3];
    STHeadlineViewController *vc4 = [[STHeadlineViewController alloc] init];
    vc4.title = @"体育";
    [self addChildViewController:vc4];
    STHeadlineViewController *vc5 = [[STHeadlineViewController alloc] init];
    vc5.title = @"移动";
    [self addChildViewController:vc5];
    STHeadlineViewController *vc6 = [[STHeadlineViewController alloc] init];
    vc6.title = @"汽车";
    [self addChildViewController:vc6];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat indexFloat = scrollView.contentOffset.x / scrollView.width;
    if (indexFloat >= 6.0) return;

    NSInteger curIndex = (NSInteger)indexFloat;
    NSInteger nexIndex = curIndex + 1;
    CGFloat curPercent = indexFloat - curIndex;
    CGFloat nexPercent = 1 - curPercent;
    STTitleLabel *newxLabel = self.titleScrollView.subviews[nexIndex];
    [newxLabel changeWithPercent:curPercent];
    
    STTitleLabel *curLabel = self.titleScrollView.subviews[curIndex];
    [curLabel changeWithPercent:nexPercent];
}



@end
