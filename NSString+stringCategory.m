//
//  NSString+stringCategory.m
//  JsonSample
//
//  Created by paradigm creatives on 9/18/14.
//  Copyright (c) 2014 Paradigm Creatives. All rights reserved.
//

#import "NSString+stringCategory.h"

@implementation NSString (stringCategory)

-(float )findSize
{
    float h=[self expectedHieght];
    return h;
    
}

-(float )expectedHieght
{
    
    CGSize maximumLabelSize = CGSizeMake(310, 9999);
    UIFont *fontText = [UIFont fontWithName:@"arial" size:16];
    CGRect textRect = [self boundingRectWithSize:maximumLabelSize
                                         options:NSStringDrawingUsesLineFragmentOrigin
                                      attributes:@{NSFontAttributeName:fontText}
                                         context:nil];
    
    
    return textRect.size.height;
    
}


@end
