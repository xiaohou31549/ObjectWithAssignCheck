//
//  MEObjectAssignCheck.m
//  ME
//
//  Created by tough on 2022/1/19.
//  Copyright © 2022 developer. All rights reserved.
//

#import "ObjectWithAssignCheck.h"
#import <objc/runtime.h>

@implementation ObjectWithAssignCheck

+ (void)checkWithClassPrefixes:(NSArray<NSString *> *)prefixes
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
        /*
         * property type encoding according to here:
         * https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/ObjCRuntimeGuide/Articles/ocrtPropertyIntrospection.html#//apple_ref/doc/uid/TP40008048-CH101-SW5
         */
        unsigned int clsCount = 0;
        Class *classes = objc_copyClassList(&clsCount);
        BOOL hasPrefixParam = prefixes.count > 0;
        for (int i = 0; i < clsCount; i++) {
            Class cls = classes[i];
            if (!cls) {
                continue;
            }
            
            const char *clsName = class_getName(cls);
            NSString *className = [NSString stringWithUTF8String:clsName];
            unsigned int propertyCount = 0;
            objc_property_t *properties = class_copyPropertyList(cls, &propertyCount);
            if (hasPrefixParam) {
                BOOL needCheck = NO;
                for (NSString *prefix in prefixes) {
                    if ([className hasPrefix:prefix]) {
                        needCheck = YES;
                        break;
                    }
                }
                
                if (!needCheck) {
                    continue;
                }
            }
            
            for (int j = 0; j < propertyCount; j++) {
                const char *attr = property_getAttributes(properties[j]);
                const char *name = property_getName(properties[j]);
                NSString *attrsEncoding = [NSString stringWithUTF8String:attr];
                //T@表示是对象
                if ([attrsEncoding hasPrefix:@"T@"]) {
                    NSArray<NSString *>* arr = [attrsEncoding componentsSeparatedByString:@","];
                    BOOL indanger = YES;
                    for (NSString* attr in arr) {
                        // & 为strong, C 为copy， W 为weak， R 为readonly
                        if ([attr isEqualToString:@"&"] || [attr isEqualToString:@"C"] || [attr isEqualToString:@"W"] || [attr isEqualToString:@"R"]) {
                            indanger = NO;
                        }
                    }
                    if (indanger) {
                        NSAssert(NO, @"%@类的属性%s使用了assign来修饰, %s是对象，会引起野指针崩溃，请修改", className, name, name);
                    }
                }
            }
            
            if (properties) {
                free(properties);
            }
        }
        if (classes) {
            free(classes);
        }
    });
}

@end
