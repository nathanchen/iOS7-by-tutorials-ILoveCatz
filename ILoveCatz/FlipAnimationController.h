//
//  FlipAnimationController.h
//  ILoveCatz
//
//  Created by Nate on 18/03/2015.
//  Copyright (c) 2015 Nathan CHEN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FlipAnimationController : NSObject<UIViewControllerAnimatedTransitioning>

@property (nonatomic) BOOL reverse;

@end
