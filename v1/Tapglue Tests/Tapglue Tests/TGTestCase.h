//
//  TGTestCase.h
//  Tapglue Tests
//
//  Created by Martin Stemmle on 02/06/15.
//  Copyright (c) 2015 Tapglue (https://www.tapglue.com/). All rights reserved.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//


#import <XCTest/XCTest.h>
#import "Tapglue+Private.h"

#define EXP_SHORTHAND YES
#import "Expecta.h"
#import "EXPMatchers+beKindOfOrNil.h"

@interface TGTestCase : XCTestCase

@property (nonatomic, readonly) NSString* appToken;

@property (nonatomic, readonly) TGConfiguration *config;

@end