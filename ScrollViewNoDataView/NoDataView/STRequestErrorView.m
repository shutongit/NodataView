//
//  RERefreshRequestErrorView.m
//  RentCarEnterprise
//
//  Created by yyl on 16/10/4.
//  Copyright © 2016年 YunNan YunDi Tech CO,LTD. All rights reserved.
//

#import "STRequestErrorView.h"

//
@implementation STRequestErrorView
//
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.tipImageView];
        [self addSubview:self.tipLabel];
        [self addSubview:self.tipButton];

    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.tipImageView.frame = CGRectMake((self.frame.size.width - 150)/2, 74, 150, 150);
    self.tipLabel.frame = CGRectMake(0, self.tipImageView.frame.origin.y + self.tipImageView.frame.size.height + 20, self.frame.size.width, 20);
    self.tipButton.frame = CGRectMake((self.frame.size.width - 120)/2, self.tipLabel.frame.origin.y + self.tipLabel.frame.size.height + 30, 120, 40);
}

- (UIImageView *)tipImageView {
    if (!_tipImageView) {
        _tipImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"RefreshTableView.bundle/refreshtableview_requesterror" inBundle:[NSBundle bundleForClass:self.class] compatibleWithTraitCollection:nil]];
    }
    return _tipImageView;
}

- (UILabel *)tipLabel {
    if (!_tipLabel) {
        _tipLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _tipLabel.text = @"请求失败，请稍后重试";
        _tipLabel.font = [UIFont systemFontOfSize:15];
        _tipLabel.textColor = [UIColor grayColor];
        _tipLabel.textAlignment = NSTextAlignmentCenter;
        _tipLabel.backgroundColor = [UIColor clearColor];
        _tipLabel.numberOfLines = 0;
    }
    return _tipLabel;
}

- (UIButton *)tipButton {
    if (!_tipButton) {
        _tipButton = [[UIButton alloc] initWithFrame:CGRectZero];
        [_tipButton setTitle:@"点击刷新" forState: UIControlStateNormal];
        [_tipButton setTitleColor:[UIColor colorWithRed:36/255.0 green:191.0/255.0 blue:161.0/255.0 alpha:1.0] forState:UIControlStateNormal];
        _tipButton.titleLabel.font = [UIFont systemFontOfSize:15];
        _tipButton.layer.cornerRadius = 5;
        _tipButton.clipsToBounds = YES;
        _tipButton.layer.borderWidth = 1.0f;
        _tipButton.layer.borderColor = [UIColor colorWithRed:36/255.0 green:191.0/255.0 blue:161.0/255.0 alpha:1.0].CGColor;
        [_tipButton addTarget:self action:@selector(tap) forControlEvents:UIControlEventTouchUpInside];
    }
    return _tipButton;
}

- (void)tap {
//    [RCAlertView showLoadingWithTitle:kLoading inView:self.superview.superview];
    !self.refreshRequestErrorViewBlock ?: self.refreshRequestErrorViewBlock();
}

@end

