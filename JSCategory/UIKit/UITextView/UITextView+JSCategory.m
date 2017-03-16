//
//  UITextView+JSCategory.m
//  JSCategoryDemo
//
//  Created by 菅思博 on 2017/3/16.
//  Copyright © 2017年 菅思博. All rights reserved.
//

#import "UITextView+JSCategory.h"

#import "NSString+JSCategory.h"

#import <objc/runtime.h>

@interface UITextView ()

@property (nonatomic, strong) UILabel *placeholderLabel;
@property (nonatomic, strong) UILabel *limitLengthLabel;

@property (nonatomic, strong) NSString *placeholder;
@property (nonatomic, copy) NSNumber *limitLength;

@end

@implementation UITextView (JSCategory)

static NSString *PLACEHOLDERLABEL = @"placeholderLabel";
static NSString *LIMITLENGTHLABEL = @"limitLengthLabel";

static NSString *PLACEHOLDER = @"placeholder";
static NSString *LIMITLENGTH = @"limitLength";

#pragma mark Set / Get
- (void)setPlaceholderLabel:(UILabel *)placeholderLabel {
    objc_setAssociatedObject(self, &PLACEHOLDERLABEL, placeholderLabel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UILabel *)placeholderLabel {
    return objc_getAssociatedObject(self, &PLACEHOLDERLABEL);
}

- (void)setLimitLengthLabel:(UILabel *)limitLengthLabel {
    objc_setAssociatedObject(self, &LIMITLENGTHLABEL, limitLengthLabel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UILabel *)limitLengthLabel {
    return objc_getAssociatedObject(self, &LIMITLENGTHLABEL);
}

- (void)setPlaceholder:(NSString *)placeholder {
    objc_setAssociatedObject(self, &PLACEHOLDER, placeholder, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)placeholder {
    return objc_getAssociatedObject(self, &PLACEHOLDER);
}

- (void)setLimitLength:(NSNumber *)limitLength {
    objc_setAssociatedObject(self, &LIMITLENGTH, limitLength, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSNumber *)limitLength {
    return objc_getAssociatedObject(self, &LIMITLENGTH);
}

#pragma mark 配置占位符标签
- (void)js_setupPlaceholderLabelWithPlaceholder:(NSString *)placeholder
                                           font:(CGFloat)font
                                          color:(UIColor *)color {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(textViewChange)
                                                 name:UITextViewTextDidChangeNotification
                                               object:self];
    
    self.placeholder = placeholder;
    
    self.placeholderLabel = [[UILabel alloc] init];
    
    self.placeholderLabel.text = self.placeholder;
    self.placeholderLabel.font = [UIFont systemFontOfSize:font];
    self.placeholderLabel.textColor = color;
    
    self.placeholderLabel.numberOfLines = 0;
    self.placeholderLabel.lineBreakMode = NSLineBreakByWordWrapping;
    
    CGSize size = [self.placeholder js_sizeForFont:[UIFont systemFontOfSize:font]
                                              size:CGSizeMake(CGRectGetWidth(self.frame) - 5.0f, CGFLOAT_MAX)
                                              mode:NSLineBreakByWordWrapping];
    
    self.placeholderLabel.frame = CGRectMake(5.0f, 8.0f, size.width, size.height);
    
    [self addSubview:self.placeholderLabel];
    
    self.placeholderLabel.hidden = self.text.length > 0 ? YES : NO;
    
}

#pragma mark 配置字数限制标签
- (void)js_setupLimitLengthLabelWithLimitLength:(NSNumber *)limitLength
                                           font:(CGFloat)font
                                          color:(nonnull UIColor *)color {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(limitLengthEvent)
                                                 name:UITextViewTextDidChangeNotification
                                               object:self];
    
    self.limitLength = limitLength;
    
    self.limitLengthLabel = [[UILabel alloc] init];
    
    if (self.text.length > [self.limitLength integerValue]) {
        self.text = [self.text substringToIndex:[self.limitLength intValue]];
    }
    
    NSString *string = [NSString stringWithFormat:@"%lu/%@", (unsigned long)self.text.length, self.limitLength];
    
    self.limitLengthLabel.text = string;
    self.limitLengthLabel.font = [UIFont systemFontOfSize:font];
    self.limitLengthLabel.textColor = color;
    
    self.limitLengthLabel.textAlignment = NSTextAlignmentRight;

    self.limitLengthLabel.frame = CGRectMake(CGRectGetWidth(self.frame) - 65.0f, CGRectGetHeight(self.frame) - 28.0f, 60.0f, 20.0f);
    
    [self addSubview:self.limitLengthLabel];
}

#pragma mark Action
- (void)textViewChange {
    if (self.placeholder) {
        self.placeholderLabel.hidden = YES;
        
        if (self.text.length == 0) {
            self.placeholderLabel.hidden = NO;
        }
    }
    
    if (self.limitLength) {
        NSInteger wordsCount = self.text.length;
        
        if (wordsCount > [self.limitLength integerValue]) {
            wordsCount = [self.limitLength integerValue];
        }
        
        self.limitLengthLabel.text = [NSString stringWithFormat:@"%ld/%@", wordsCount, self.limitLength];
    }
}

- (void)limitLengthEvent {
    if ([self.text length] > [self.limitLength intValue]) {
        self.text = [self.text substringToIndex:[self.limitLength intValue]];
    }
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UITextViewTextDidChangeNotification
                                                  object:self];
}

@end
