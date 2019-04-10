//
//  RCRefreshNoDataView.m
//  YunDiRentCar
//
//  Created by yyl on 16/12/31.
//  Copyright © 2016年 YunDi.Tech. All rights reserved.
//

#import "STNoDataView.h"
#import "SDAutoLayout.h"


@implementation STNoDataView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        [self addSubview:self.tipImageView];
        [self addSubview:self.tipLabel];
        self.tipImageView.contentMode = UIViewContentModeScaleAspectFit;
        
        self.tipImageView.sd_layout
        .centerYIs(self.centerY_sd).offset(20)
        .leftEqualToView(self)
        .rightEqualToView(self)
        .heightIs(100);
        
        self.tipLabel.sd_layout
        .topSpaceToView(self.tipImageView, 16)
        .leftEqualToView(self)
        .rightEqualToView(self)
        .heightIs(20);
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
}

- (UIImageView *)tipImageView {
    if (!_tipImageView) {
        _tipImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"RefreshTableView.bundle/refreshtableview_defaultnodata" inBundle:[NSBundle bundleForClass:self.class] compatibleWithTraitCollection:nil]];
    }
    return _tipImageView;
}

- (UILabel *)tipLabel {
    if (!_tipLabel) {
        _tipLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _tipLabel.text = @"暂无数据";
        _tipLabel.font = [UIFont systemFontOfSize:17];
        _tipLabel.textColor = [UIColor grayColor];
        _tipLabel.textAlignment = NSTextAlignmentCenter;
        _tipLabel.backgroundColor = [UIColor clearColor];
    }
    return _tipLabel;
}


@end
