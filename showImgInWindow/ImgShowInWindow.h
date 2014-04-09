//
//  ImgShowInWindow.h
//  showImgInWindow
//
//  Created by shan xu on 14-4-9.
//  Copyright (c) 2014年 夏至. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImgShowInWindow : UIImageView<UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIImage *fullImg;
@property (nonatomic, assign) CGRect normalImgRect;

- (id)initWithNormalImage:(UIImage *)normalImage fullImage:(UIImage *)fullImage frame:(CGRect)frame;
@end
