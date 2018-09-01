//
//  UITextField+TextSeparater.m
//  HHProject
//
//  Created by huang on 2018/5/28.
//  Copyright © 2018年 huang. All rights reserved.
//

#import "UITextField+TextSeparater.h"
#import <objc/runtime.h>

#define SeparatedDistance  10.f

@implementation UITextField (TextSeparater)

- (void)setIsKvoText:(BOOL)isKvoText{
    objc_setAssociatedObject(self, @selector(isKvoText), [NSNumber numberWithBool:isKvoText], OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)isKvoText{
    return [objc_getAssociatedObject(self, @selector(isKvoText)) boolValue];
}

- (NSInteger)separatedInterval{
    return [objc_getAssociatedObject(self, @"separatedIntervalKey") integerValue];
}

- (void)setSeparatedInterval:(NSInteger)separatedInterval{
    
    objc_setAssociatedObject(self, @"separatedIntervalKey", [NSNumber numberWithInteger:separatedInterval], OBJC_ASSOCIATION_ASSIGN);
    [self setIsKvoText:YES];
    [self addObserver:self forKeyPath:@"text" options:NSKeyValueObservingOptionNew context:nil];
    [self addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventAllEditingEvents];
}


-(void)valueChanged:(UITextField*)tf{
    UITextRange * editRange =  self.selectedTextRange;
    if ((tf.text != nil) && (tf.text.length>self.separatedInterval) ) {
        NSMutableAttributedString * string =[[NSMutableAttributedString alloc]initWithString:tf.text];
        
        for (int i = 1; i < tf.text.length; i ++) {
            if ( i %self.separatedInterval == 0) {
                [string addAttribute:NSKernAttributeName value:[NSNumber numberWithFloat:SeparatedDistance] range:NSMakeRange(i-1, 1)];
            }
        }
        self.attributedText = string;
        self.selectedTextRange = editRange;
    }
    
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"text"]) {
        UITextRange * editRange =  self.selectedTextRange;
        UITextField * tf = (UITextField*)object;
        if ((tf.text != nil) && (tf.text.length>self.separatedInterval) ) {
            NSMutableAttributedString * string =[[NSMutableAttributedString alloc]initWithString:tf.text];
            for (int i = 1; i < tf.text.length; i ++) {
                if ( i %self.separatedInterval == 0) {
                    [string addAttribute:NSKernAttributeName value:[NSNumber numberWithFloat:SeparatedDistance] range:NSMakeRange((i-1), 1)];
                }
            }
            self.attributedText = string;
            self.selectedTextRange = editRange;
        }
    }
    
}
- (void)dealloc{
    if ([self isKvoText]) {
        [self removeObserver:self forKeyPath:@"text"];
        [self setIsKvoText:NO];
    }
    [self removeTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventAllEditingEvents];
}

@end
