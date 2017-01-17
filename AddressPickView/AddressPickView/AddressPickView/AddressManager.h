//
//  AddressManager.h
//  AddressPickView
//
//  Created by CalvinCheung on 2017/1/17.
//  Copyright © 2017年 CalvinCheung. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AddressManager : NSObject

+ (instancetype)shareInstance;

@property (nonatomic,strong) NSArray *provinceDicAry; // 省字典数组

#define CusAddressManager [AddressManager shareInstance]

@end
