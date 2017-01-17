//
//  RootViewController.m
//  AddressPickView
//
//  Created by CalvinCheung on 2017/1/17.
//  Copyright © 2017年 CalvinCheung. All rights reserved.
//

#import "RootViewController.h"
#import "AddressPickView.h"
#import "AddressManager.h"

@interface RootViewController ()

@property (nonatomic,strong) AddressPickView *regionPickerView;
@property (nonatomic,strong) UILabel *addressLabel;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _addressLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, self.view.frame.size.width - 84, 44)];
//    _addressLabel.text = @"广东 深圳 南山区";
    [self.view addSubview:_addressLabel];
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(self.view.frame.size.width - 74, 100, 64, 44);
    button.backgroundColor = [UIColor clearColor];
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    [button setTitleColor:[UIColor colorWithRed:0/255.0 green:122/255.0 blue:255/255.0 alpha:1.0] forState:UIControlStateNormal];
    [button setTitle:@"地址选择" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(show:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)show:(UIButton *)sender {
    NSString *address = _addressLabel.text;
    NSArray *array = [address componentsSeparatedByString:@" "];
    
    NSString *province = @"";//省
    NSString *city = @"";//市
    NSString *county = @"";//县
    if (array.count > 2) {
        province = array[0];
        city = array[1];
        county = array[2];
    } else if (array.count > 1) {
        province = array[0];
        city = array[1];
    } else if (array.count > 0) {
        province = array[0];
    }
    
    [self.regionPickerView showPickerWithProvinceName:province cityName:city countyName:county];
}

- (AddressPickView *)regionPickerView {
    if (!_regionPickerView) {
        _regionPickerView = [[AddressPickView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        
        __weak typeof(self) wself = self;
        _regionPickerView.completion = ^(NSString *provinceName,NSString *cityName,NSString *countyName) {
            __strong typeof(wself) self = wself;
            self.addressLabel.text = [NSString stringWithFormat:@"%@ %@ %@",provinceName,cityName,countyName];
        };
        [self.navigationController.view addSubview:_regionPickerView];
    }
    return _regionPickerView;
}

@end
