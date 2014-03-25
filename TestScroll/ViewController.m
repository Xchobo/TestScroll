//
//  ViewController.m
//  TestScroll
//
//  Created by proj on 14/3/25.
//  Copyright (c) 2014年 proj. All rights reserved.
//

#import "ViewController.h"

// 鍵盤高度(縱向、橫向)
#define KBPHEIGHT 216;
#define KBLHEIGHT 162;

@interface ViewController () <UITextViewDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UITextView *mainTextView;
@property (strong, nonatomic) IBOutlet UITextField *mainTextViewShowKB;
@property (strong, nonatomic) IBOutlet UITextField *mainTextViewHideKB;


@end

@implementation ViewController

- (void)clicked:(id)sender with:(int)var {
    [_mainTextView resignFirstResponder];
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    // - AccessoryView Start -------------------------------------------------
    // 製作一個AccessoryView
    UIView *myAccessoryView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 36)];
    [myAccessoryView setBackgroundColor:[UIColor colorWithRed:0.927 green:0.914 blue:0.894 alpha:1.000]];
    
    // 文字提示
    UILabel *tipLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 30)];
    [tipLabel setText:@"提示文字"];
    [tipLabel setTextColor:[UIColor lightGrayColor]];
    [tipLabel setBackgroundColor:[UIColor clearColor]];
    
    UIButton *doneBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [doneBtn setFrame:CGRectMake(260, 3, 60, 30)];
    [doneBtn setTitle:@"Done" forState:UIControlStateNormal];
    
    //增加按鈕動作
    [doneBtn addTarget:self action:@selector(clicked:with:) forControlEvents:UIControlEventTouchUpInside];
    
    // 增加至畫面中
    [myAccessoryView addSubview: tipLabel];
    [myAccessoryView addSubview: doneBtn];
    
    //以TextField為例加入自訂的AccessoryView
    [_mainTextView setInputAccessoryView:myAccessoryView];
    // - AccessoryView END ------------------------------------------------------------
    
    //計算Scrolll要縮小的高度
    CGRect viewFrame = [_scrollView frame];
    viewFrame.size.height = viewFrame.size.height - KBPHEIGHT;
    _scrollView.frame = viewFrame;
    
    //切換至隱藏的TextField：_mainTextViewShowKB
    [_scrollView scrollRectToVisible:_mainTextViewShowKB.frame animated:YES];
    return YES;
}
- (BOOL)textViewShouldEndEditing:(UITextView *)textView{
    //計算Scrolll要縮小的高度
    CGRect viewFrame = [_scrollView frame];
    viewFrame.size.height = viewFrame.size.height + KBPHEIGHT;
    _scrollView.frame = viewFrame;
    
    //切換至隱藏的TextField：_mainTextViewHideKB
    [_scrollView scrollRectToVisible:_mainTextViewHideKB.frame animated:YES];
    return YES;
}

- (void) viewDidAppear:(BOOL)animated{
    [_scrollView setFrame:CGRectMake(0, 0, 320, 568)];
    [_scrollView setContentSize:CGSizeMake(320, 992)];
    
    [_mainTextView setDelegate:self];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [_imageView setImage:[UIImage imageNamed:@"img"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
