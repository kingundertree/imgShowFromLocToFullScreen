//
//  AJKMViewController.m
//  showImgInWindow
//
//  Created by shan xu on 14-4-9.
//  Copyright (c) 2014年 夏至. All rights reserved.
//

#import "AJKMViewController.h"
#import "ImgShowInWindow.h"

@interface AJKMViewController ()
@end

@implementation AJKMViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    ImgShowInWindow *img = [[ImgShowInWindow alloc] init];
    
    UIImageView *imgView = [img initWithNormalImage:[UIImage imageNamed:@"lys.jpg"] fullImage:[UIImage imageNamed:@"ly.jpg"] frame:CGRectMake(200, 80, 100, 150)];
    [self.view addSubview:imgView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
