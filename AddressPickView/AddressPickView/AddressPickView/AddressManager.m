//
//  AddressManager.m
//  AddressPickView
//
//  Created by CalvinCheung on 2017/1/17.
//  Copyright © 2017年 CalvinCheung. All rights reserved.
//

#import "AddressManager.h"

@interface AddressManager ()

@end

@implementation AddressManager

+ (instancetype)shareInstance {
    static AddressManager *_addressManager = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _addressManager = [[self alloc] init];
    });
    return _addressManager;
}

- (NSArray *)provinceDicAry {
    if (!_provinceDicAry) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"address" ofType:@"plist"];
        _provinceDicAry = [[NSArray alloc] initWithContentsOfFile:path];
    }
    return _provinceDicAry;
}

@end
