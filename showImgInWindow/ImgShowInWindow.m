//
//  ImgShowInWindow.m
//  showImgInWindow
//
//  Created by shan xu on 14-4-9.
//  Copyright (c) 2014年 夏至. All rights reserved.
//

#import "ImgShowInWindow.h"

@implementation ImgShowInWindow
@synthesize fullImg;
@synthesize normalImgRect;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithNormalImage:(UIImage *)normalImage fullImage:(UIImage *)fullImage frame:(CGRect)frame{
    fullImg = fullImage;
    
    self.frame = frame;
    self.image = normalImage;
    self.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imgTap:)];
    tapGes.delegate = self;
    tapGes.numberOfTouchesRequired = 1;
    tapGes.numberOfTapsRequired = 1;
    [self addGestureRecognizer:tapGes];
    
    return self;
}

- (void)imgTap:(UIGestureRecognizer *)tapGes{
    UIImageView *tapView = (UIImageView *)tapGes.view;
    
    [self showInWindow:tapView];
}

- (void)showInWindow:(UIImageView *)normalImg{
    self.userInteractionEnabled = NO;
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    normalImgRect = [normalImg convertRect:normalImg.bounds toView:window];
    
    UIImageView *fullImgView = [[UIImageView alloc] init];
    fullImgView.frame = normalImgRect;
    [fullImgView setImage:fullImg];
    fullImgView.userInteractionEnabled = YES;
    [window addSubview:fullImgView];
    
    [UIView animateWithDuration:.5 animations:^{
        fullImgView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    } completion:^(BOOL finished) {
        UITapGestureRecognizer *fullTapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(fullImgTap:)];
        fullTapGes.delegate = self;
        fullTapGes.numberOfTouchesRequired = 1;
        fullTapGes.numberOfTapsRequired = 1;
        [fullImgView addGestureRecognizer:fullTapGes];
    }];
}

- (void)fullImgTap:(UIGestureRecognizer *)tapGes{
    UIImageView *fullImgView = (UIImageView *)tapGes.view;
    
    [self hideFullImgView:fullImgView];
}
- (void)hideFullImgView:(UIImageView *)fullImgView{
    [UIView animateWithDuration:.5 animations:^{
        fullImgView.frame = normalImgRect;
    } completion:^(BOOL finished) {
        self.userInteractionEnabled = YES;
        [fullImgView removeFromSuperview];
    }];
}


@end
