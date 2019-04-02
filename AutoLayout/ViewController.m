//
//  ViewController.m
//  AutoLayout
//
//  Created by 朱志佳 on 2019/4/2.
//  Copyright © 2019 朱志佳. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"

@interface ViewController ()

@property (nonatomic, strong) MASConstraint *topConstraint;
@property (nonatomic, strong) UIView *superview;
@property (nonatomic, strong) UIView *view1;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //[self test];
    
    //[self test1];
    
    //[self test2];
    
    [self test3];
}

- (void)test {
    
    UIView *view1 = [[UIView alloc] init];
    view1.translatesAutoresizingMaskIntoConstraints = NO;
    view1.backgroundColor = [UIColor greenColor];
    [self.view addSubview:view1];
    
    UIEdgeInsets padding = UIEdgeInsetsMake(10, 10, 10, 10);
    [self.view addConstraints:@[
                                [NSLayoutConstraint constraintWithItem:view1 attribute:(NSLayoutAttributeTop) relatedBy:(NSLayoutRelationEqual) toItem:self.view attribute:(NSLayoutAttributeTop) multiplier:1.0 constant:padding.top],
    
                                [NSLayoutConstraint constraintWithItem:view1 attribute:(NSLayoutAttributeLeft) relatedBy:(NSLayoutRelationEqual) toItem:self.view attribute:(NSLayoutAttributeLeft) multiplier:1.0 constant:padding.left],
     
                                [NSLayoutConstraint constraintWithItem:view1 attribute:(NSLayoutAttributeBottom) relatedBy:(NSLayoutRelationEqual) toItem:self.view attribute:(NSLayoutAttributeBottom) multiplier:1.0 constant:-padding.bottom],
     
                                [NSLayoutConstraint constraintWithItem:view1 attribute:(NSLayoutAttributeRight) relatedBy:(NSLayoutRelationEqual) toItem:self.view attribute:(NSLayoutAttributeRight) multiplier:1.0 constant:-padding.right]
    
     ]];
    
    
}

- (void)test1 {
    
    UIEdgeInsets padding = UIEdgeInsetsMake(10, 10, 10, 10);
    
    UIView *view = [[UIView alloc] initWithFrame:self.view.bounds];
    self.superview = view;
    view.backgroundColor = [UIColor greenColor];
    [self.view addSubview:view];
    
    UIView *view1 = [[UIView alloc] init];
    self.view1 = view1;
    view1.backgroundColor = [UIColor redColor];
    [view addSubview:view1];
    
//    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(view.mas_top).offset(padding.top);
//        make.left.equalTo(view.mas_left).offset(padding.left);
//        make.bottom.equalTo(view.mas_bottom).offset(-padding.bottom);
//        make.right.equalTo(view.mas_right).offset(-padding.right);
//    }];
    
//    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(view.mas_top).mas_offset(padding.top);
//        make.left.mas_equalTo(view.mas_left).mas_offset(padding.left);
//        make.bottom.mas_equalTo(view.mas_bottom).mas_offset(-padding.bottom);
//        make.right.mas_equalTo(view.mas_right).mas_offset(-padding.right);
//    }];
    
//    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(view).insets(padding);
//    }];
    
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        self.topConstraint = make.top.equalTo(view.mas_top).offset(padding.top);
        make.left.equalTo(view.mas_left).offset(padding.left);
        make.bottom.equalTo(view.mas_bottom).offset(-padding.bottom);
        make.right.equalTo(view.mas_right).offset(-padding.right);
    }];
    
    // then later you can call
    //[self.topConstraint uninstall];
    
    //[self.topConstraint install];
 
    [self updateConstraints];
    
    [self changePosition];
}

- (void)updateConstraints {
    
    [self.view1 mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.superview.mas_top).offset(20);
        make.left.equalTo(self.superview.mas_left).offset(20);
        make.bottom.equalTo(self.superview.mas_bottom).offset(-20);
        make.right.equalTo(self.superview.mas_right).offset(-20);
    }];
    
    [super updateViewConstraints];
}

- (void)changePosition {
    [self.view1 mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(self.superview);
        make.top.equalTo(self.superview).offset(10);
    }];
}

- (void) test2 {
    
    UIView *sv = [UIView new];
    [self.view addSubview:sv];
    sv.backgroundColor = [UIColor blackColor];
    [sv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(300, 300));
    }];
    
    
    UIView *sv1 = [UIView new];
    [sv addSubview:sv1];
    sv1.backgroundColor = [UIColor redColor];
    [sv1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(sv).insets(UIEdgeInsetsMake(10, 10, 10, 10));
    }];
    
    int padding = 10;
    UIView *sv2 = [UIView new];
    [sv addSubview:sv2];
    sv2.backgroundColor = [UIColor blueColor];
    
    UIView *sv3 = [UIView new];
    [sv addSubview:sv3];
    sv3.backgroundColor = [UIColor blueColor];
    
    
    [sv2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(sv);
        make.left.equalTo(sv.mas_left).offset(padding);
        make.right.equalTo(sv3.mas_left).offset(-padding);
        make.height.equalTo(@150);
        make.width.equalTo(sv3);
    }];
    
    [sv3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(sv);
        make.left.equalTo(sv2.mas_right).offset(padding);
        make.right.equalTo(sv.mas_right).offset(-padding);
        make.height.equalTo(@150);
        make.width.equalTo(sv2);
    }];
    
}

- (void)test3 {
    
    UIView *sv = [UIView new];
    [self.view addSubview:sv];
    sv.backgroundColor = [UIColor blackColor];
    [sv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(300, 300));
    }];
    
    UIScrollView *scrollView = [UIScrollView new];
    [sv addSubview:scrollView];
    scrollView.backgroundColor = [UIColor whiteColor];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(sv).insets(UIEdgeInsetsMake(5, 5, 5, 5));
    }];
    
    UIView *container = [UIView new];
    [scrollView addSubview:container];
    container.backgroundColor = [UIColor yellowColor];
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(scrollView);//只设置了left 和 right
        make.width.equalTo(scrollView);
    }];
    
    int count = 10;

    UIView *lastView = nil;

    for (int i = 1; i <= count; ++i) {
        UIView *subView = [UIView new];
        [container addSubview:subView];
        subView.backgroundColor = [UIColor colorWithHue:( arc4random() % 256 / 256.0 ) saturation:( arc4random() % 128 / 256.0 ) + 0.5 brightness:( arc4random() % 128 / 256.0 ) + 0.5 alpha:1];

        [subView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(container);
            make.height.equalTo(@(20 * i));
            if (lastView) {
                make.top.equalTo(lastView.mas_bottom);
            }else {
                make.top.equalTo(container.mas_top);
            }
        }];

        lastView = subView;
    }
    
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(lastView.mas_bottom);
    }];
    
    
    
}



@end
