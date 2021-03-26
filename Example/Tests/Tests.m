//
//  ZLFBaseConfigToolTests.m
//  ZLFBaseConfigToolTests
//
//  Created by 1553427003@qq.com on 07/30/2019.
//  Copyright (c) 2019 1553427003@qq.com. All rights reserved.
//

@import XCTest;
#import <ZLFBase.h>
@interface Tests : XCTestCase

@end

@implementation Tests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample{
    NSAssert([@"12323230122222222222" isNumber] == YES, @"fail");
//    NSAssert([@"wifoweh为你微风后卫i额" floatValue] > 0, @"fail");
//    NSAssert([@"wifoweh为你微风后卫i额" floatValue] == 0, @"fail");
//    NSAssert([@"wifoweh为你微风后卫i额" floatValue] < 0, @"fail");
}

@end

