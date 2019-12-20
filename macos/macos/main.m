//
//  main.m
//  macos
//
//  Created by Christoph Purrer on 10/30/19.
//  Copyright © 2019 Christoph Purrer. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <React/RCTBridge.h>
#import <React/RCTBundleURLProvider.h>
#import <React/RCTRootView.h>

NSString* kBundleNameJS = @"App";

@interface ReactNativeWindow : NSWindowController <NSWindowDelegate, RCTBridgeDelegate> {
    RCTRootView* rootView_;
    RCTBridge* bridge_;
}
@end

@implementation ReactNativeWindow

- (id)init {
    NSWindow* window = [[NSWindow alloc]
                        initWithContentRect:NSMakeRect(0, [[NSScreen mainScreen] frame].size.height - 640, 360, 640)
                        styleMask:NSWindowStyleMaskTitled | NSWindowStyleMaskClosable |
                        NSWindowStyleMaskResizable
                        backing:NSBackingStoreBuffered
                        defer:NO];
    if (self = [self initWithWindow:window]) {
        [self.window makeKeyAndOrderFront:NULL];
        
        bridge_ = [[RCTBridge alloc] initWithDelegate:self launchOptions:nil];
        rootView_ = [[RCTRootView alloc] initWithBridge:bridge_
                                             moduleName:kBundleNameJS
                                      initialProperties:nil];
        rootView_.frame = NSMakeRect(0, 0, self.window.frame.size.width, self.window.frame.size.height);
        rootView_.autoresizingMask = (NSViewMinXMargin | NSViewMinXMargin | NSViewMinYMargin |
                                      NSViewMaxYMargin | NSViewWidthSizable | NSViewHeightSizable);
        [self.window.contentView addSubview:rootView_];
    }
    return self;
}

- (NSURL*)sourceURLForBridge:(__unused RCTBridge*)bridge {
    NSString* jsBundlePath = [NSString stringWithFormat:@"%@.index", kBundleNameJS];
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
        [ReactNativeWindow new];
        [[NSApplication sharedApplication] run];
    }
    return 0;
}
