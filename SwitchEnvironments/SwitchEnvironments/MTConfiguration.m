//
//  AppConfiguration.m
//  SwitchEnvironments
//
//  Created by Anirudh Nagesh on 1/6/16.
//  Copyright © 2016 Proteus Digital Health. All rights reserved.
//

#import "MTConfiguration.h"

#define AppConfigurationAPIEndpoint @"AppAPIEndpoint"
#define AppConfigurationLoggingEnabled @"AppLoggingEnabled"

@interface MTConfiguration ()

@property (copy, nonatomic) NSString *configuration;
@property (nonatomic, strong) NSDictionary *variables;

@end

@implementation MTConfiguration

#pragma mark -
#pragma mark Shared Configuration
+ (MTConfiguration *)sharedConfiguration {
    static MTConfiguration *_sharedConfiguration = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedConfiguration = [[self alloc] init];
    });
    
    return _sharedConfiguration;
}

#pragma mark -
#pragma mark Private Initialization
- (id)init {
    self = [super init];
    
    if (self) {
        // Fetch Current Configuration
        NSBundle *mainBundle = [NSBundle mainBundle];
        self.configuration = [[mainBundle infoDictionary] objectForKey:@"Configuration"];
        
        // Load Configurations
        NSString *path = [mainBundle pathForResource:@"Configurations" ofType:@"plist"];
        NSDictionary *configurations = [NSDictionary dictionaryWithContentsOfFile:path];
        
        // Load Variables for Current Configuration
        self.variables = [configurations objectForKey:self.configuration];
    }
    
    return self;
}

#pragma mark -
+ (NSString *)configuration {
    return [[MTConfiguration sharedConfiguration] configuration];
}

#pragma mark -
+ (NSString *)APIEndpoint {
    MTConfiguration *sharedConfiguration = [MTConfiguration sharedConfiguration];
    
    if (sharedConfiguration.variables) {
        return [sharedConfiguration.variables objectForKey:AppConfigurationAPIEndpoint];
    }
    
    return nil;
}

+ (BOOL)isLoggingEnabled {
    MTConfiguration *sharedConfiguration = [MTConfiguration sharedConfiguration];
    
    if (sharedConfiguration.variables) {
        return [[sharedConfiguration.variables objectForKey:AppConfigurationLoggingEnabled] boolValue];
    }
    
    return NO;
}

@end
