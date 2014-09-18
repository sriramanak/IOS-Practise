//
//  MyAnnotation.m
//  MapKitSample
//
//  Created by paradigm creatives on 9/11/14.
//  Copyright (c) 2014 Paradigm Creatives. All rights reserved.
//

#import "MyAnnotation.h"

@implementation MyAnnotation

-(id)initWithTitle:(NSString *)title andCoordinate:
(CLLocationCoordinate2D)coordinate2d{
    self.title = title;
    self.coordinate =coordinate2d;
    return self;
}
@end
