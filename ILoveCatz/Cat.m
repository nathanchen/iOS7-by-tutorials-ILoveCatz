//
//  Cat.m
//  ILoveCatz
//
//  Created by Nate on 17/03/2015.
//  Copyright (c) 2015 Nathan CHEN. All rights reserved.
//

#import "Cat.h"

@implementation Cat

- (instancetype)initWithImage:(NSString *)image
                        title:(NSString *)title
                  attribution:(NSString *)attribution
{
    self = [super init];
    _image = image;
    _title = title;
    _attribution = attribution;
    return self;
}

@end
