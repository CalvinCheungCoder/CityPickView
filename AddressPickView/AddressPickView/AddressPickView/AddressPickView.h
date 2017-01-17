//
//  AddressPickView.h
//  AddressPickView
//
//  Created by CalvinCheung on 2017/1/17.
//  Copyright © 2017年 CalvinCheung. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddressPickView : UIView

@property (nonatomic,copy) void (^completion)(NSString *provinceName,NSString *cityName,NSString *countyName);

// 显示 省 市 县名
- (void)showPickerWithProvinceName:(NSString *)provinceName cityName:(NSString *)cityName countyName:(NSString *)countyName;



@end
