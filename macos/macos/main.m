//
//  main.m
//  RNmacos
//
//  Created by Christoph Purrer on 10/30/19.
//  Copyright © 2019 Christoph Purrer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>
#import <React/RCTRootView.h>
#import <React/RCTBridge.h>
#import <React/RCTBundleURLProvider.h>

NSString *kBundleNameJS = @"RNmacos";

@interface BridgeDelegate : NSObject <RCTBridgeDelegate> @end

@implementation BridgeDelegate

- (NSURL *)sourceURLForBridge:(__unused RCTBridge *)bridge
{
    NSString *jsBundlePath = [NSString stringWithFormat:@"%@.index", kBundleNameJS];
    //    return [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:jsBundlePath
    //                                                          fallbackResource:nil];
    return [RCTBundleURLProvider jsBundleURLForBundleRoot:jsBundlePath
                                             packagerHost:@"127.0.0.1"
                                                enableDev:YES
                                       enableMinification:NO];
}

@end


int main() {
    @autoreleasepool {
        [NSApplication sharedApplication];
        
        NSRect bounds = NSMakeRect(0, 0, 720, 1280);
        NSWindow* window =
        [[NSWindow alloc] initWithContentRect:bounds
                                    styleMask:NSWindowStyleMaskTitled | NSWindowStyleMaskResizable
                                      backing:NSBackingStoreBuffered
                                        defer:NO];
        
        RCTBridge *bridge = [[RCTBridge alloc] initWithDelegate: [BridgeDelegate new]
                                                  launchOptions:nil];
        RCTRootView *rootView = [[RCTRootView alloc] initWithBridge:bridge
                                                         moduleName:kBundleNameJS
                                                  initialProperties:nil];
        rootView.frame = bounds;
        [window.contentView addSubview:rootView];
        [window makeKeyAndOrderFront:nil];
        [NSApp activateIgnoringOtherApps:YES];
        [NSApp run];
    }
    return 0;
}
