//
//  BouncePresentAnimationController.m
//  ILoveCatz
//
//  Created by Nate on 18/03/2015.
//  Copyright (c) 2015 Nathan CHEN. All rights reserved.
//

#import "BouncePresentAnimationController.h"

@implementation BouncePresentAnimationController

- (NSTimeInterval)transitionDuration: (id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    CGRect finalFrame = [transitionContext finalFrameForViewController:toViewController];
    
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    toViewController.view.frame = CGRectOffset(finalFrame, 0, screenBounds.size.height);
    [containerView addSubview:toViewController.view];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
//    [UIView animateWithDuration:duration animations:^{
//        fromViewController.view.alpha = 0.5;
//        toViewController.view.frame = finalFrame;
//    } completion:^(BOOL finished) {
//        [transitionContext completeTransition:YES];
//        fromViewController.view.alpha = 1.0;
//    }];
    
    [UIView animateWithDuration:duration
                          delay:0.0
         usingSpringWithDamping:0.6
          initialSpringVelocity:0.0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         fromViewController.view.alpha = 0.5;
                         toViewController.view.frame = finalFrame;
                     } completion:^(BOOL finished) {
                         [transitionContext completeTransition:YES];
                         fromViewController.view.alpha = 1.0;
                     }];
}

@end
