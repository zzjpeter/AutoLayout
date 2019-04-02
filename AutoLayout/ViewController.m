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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self test];
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

@end
