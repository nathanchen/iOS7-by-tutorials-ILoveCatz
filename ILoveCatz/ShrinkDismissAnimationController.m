//
//  ShrinkDismissAnimationController.m
//  ILoveCatz
//
//  Created by Nate on 18/03/2015.
//  Copyright (c) 2015 Nathan CHEN. All rights reserved.
//

#import "ShrinkDismissAnimationController.h"

@implementation ShrinkDismissAnimationController

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    CGRect finalFrame = [transitionContext finalFrameForViewController:toViewController];
    
    UIView *containerView = [transitionContext containerView];
    
    toViewController.view.frame = finalFrame;
    toViewController.view.alpha = 0.5;
    
    [containerView addSubview:toViewController.view];
    [containerView sendSubviewToBack:toViewController.view];
    
    // animation
    CGRect screenBounds = [UIScreen mainScreen].bounds;
    CGRect shrunkenFrame = CGRectInset(fromViewController.view.frame, fromViewController.view.frame.size.width / 4, fromViewController.view.frame.size.height / 4); // shrink
    CGRect fromFinalFrame = CGRectOffset(shrunkenFrame, 0, screenBounds.size.height); //fly away
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
//    UIView *intermediateView = [fromViewController.view snapshotViewAfterScreenUpdates:NO];
//    intermediateView.frame = fromViewController.view.frame;
//    [containerView addSubview:intermediateView];
//    
//    [fromViewController.view removeFromSuperview];
//    
//    [UIView animateKeyframesWithDuration:duration
//                                   delay:0
//                                 options:UIViewKeyframeAnimationOptionCalculationModeCubic
//                              animations:^{
//                                  [UIView addKeyframeWithRelativeStartTime:0.0
//                                                          relativeDuration:0.5
//                                                                animations:^{
//                                                                    intermediateView.frame = shrunkenFrame;
//                                                                    toViewController.view.alpha = 0.5;
//                                                                }];
//                                  [UIView addKeyframeWithRelativeStartTime:0.5
//                                                          relativeDuration:0.5
//                                                                animations:^{
//                                                                    intermediateView.frame = fromFinalFrame;
//                                                                    toViewController.view.alpha = 1;
//                                                                }];
//                              } completion:^(BOOL finished) {
//                                  [intermediateView removeFromSuperview];
//                                  [transitionContext completeTransition:YES];
//                              }];
    
    [UIView animateKeyframesWithDuration:duration
                          delay:0
                        options:UIViewKeyframeAnimationOptionCalculationModeCubic
                     animations:^{
                         [UIView addKeyframeWithRelativeStartTime:0
                                                 relativeDuration:0.5
                                                       animations:^{
                                                           fromViewController.view.transform = CGAffineTransformMakeScale(0.5, 0.5);
                                                           toViewController.view.alpha = 0.5;
                                                       }];
                         [UIView addKeyframeWithRelativeStartTime:0.5
                                                 relativeDuration:0.5
                                                       animations:^{
                                                           fromViewController.view.frame = fromFinalFrame;
                                                           toViewController.view.alpha = 1;
                                                       }];
                     } completion:^(BOOL finished) {
                         [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
                     }];
}

@end
