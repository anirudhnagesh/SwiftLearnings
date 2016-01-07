//
//  AppConfiguration.h
//  SwitchEnvironments
//
//  Created by Anirudh Nagesh on 1/6/16.
//  Copyright © 2016 Proteus Digital Health. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MTConfiguration : NSObject

#pragma mark -
+ (NSString *)configuration;

#pragma mark -
+ (NSString *)APIEndpoint;
+ (BOOL)isLoggingEnabled;

@end
