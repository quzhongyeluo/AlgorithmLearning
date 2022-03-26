//
//  main.m
//  Algorithm
//
//  Created by 曲终叶落 on 2022/3/27.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "BinarySearch.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
    }
    [BinarySearch start];
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
