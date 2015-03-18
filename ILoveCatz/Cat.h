//
//  Cat.h
//  ILoveCatz
//
//  Created by Nate on 17/03/2015.
//  Copyright (c) 2015 Nathan CHEN. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cat : NSObject

@property (nonatomic, weak) NSString *image;
@property (nonatomic, weak) NSString *title;
@property (nonatomic, weak) NSString *attribution;

- (instancetype)initWithImage:(NSString *)image
                        title:(NSString *)title
                  attribution:(NSString *)attribution;

@end
