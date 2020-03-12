//
//  UIViewController_Swizzling.m
//  Takeout_iOS
//
//  Created by Kazutoshi Baba on 2018/10/04.
//  Copyright © 2018 SeesaaVN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

@interface UIViewController (Swizzling)
@end

@implementation UIViewController (Swizzling)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once (&onceToken, ^{
        [self swizzleOriginalSelector:@selector(viewWillAppear:)
                  withSizzledSelector:@selector(swizzled_viewWillAppear:)
                             forClass:[self class]
                        isClassMethod:NO];
        [self swizzleOriginalSelector:@selector(viewWillDisappear:)
                  withSizzledSelector:@selector(swizzled_viewWillDisappear:)
                             forClass:[self class]
                        isClassMethod:NO];
    });
}

+ (void)swizzleOriginalSelector:(SEL)originalSelector
            withSizzledSelector:(SEL)swizzledSelector
                       forClass:(Class)class
                  isClassMethod:(BOOL)isClassMethod
{
    Method originalMethod;
    Method swizzledMethod;
    
    if (isClassMethod) {
        originalMethod = class_getClassMethod(class, originalSelector);
        swizzledMethod = class_getClassMethod([self class], swizzledSelector);
    } else {
        originalMethod = class_getInstanceMethod(class, originalSelector);
        swizzledMethod = class_getInstanceMethod([self class], swizzledSelector);
    }
    
    NSAssert(originalMethod, @"originalMethod should not be nil");
    NSAssert(swizzledMethod, @"swizzledMethod should not be nil");
    
    method_exchangeImplementations(originalMethod, swizzledMethod);
}

- (void)swizzled_viewWillAppear:(BOOL)animated
{
    [self swizzled_viewWillAppear:animated];
}

- (void)swizzled_viewWillDisappear:(BOOL)animated
{
    [self swizzled_viewWillDisappear:animated];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@""
                                                                             style:UIBarButtonItemStylePlain target:nil
                                                                            action:nil];
}

@end
