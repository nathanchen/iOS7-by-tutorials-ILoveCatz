//
//  FlipAnimationController.m
//  ILoveCatz
//
//  Created by Nate on 18/03/2015.
//  Copyright (c) 2015 Nathan CHEN. All rights reserved.
//

#import "FlipAnimationController.h"

@implementation FlipAnimationController

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 1.0;
}

- (CATransform3D)yRotation: (double)angle
{
    return CATransform3DMakeRotation((CGFloat)angle, 0, 1, 0);
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIView *containerView = [transitionContext containerView];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    UIView *toView = toViewController.view;
    UIView *fromView = fromViewController.view;
    [containerView addSubview:toView];
    
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = -0.002;
    containerView.layer.sublayerTransform = transform;
    
    CGRect initialFrame = [transitionContext initialFrameForViewController:fromViewController];
    fromView.frame = initialFrame;
    toView.frame = initialFrame;
    
    float factor = _reverse ? 1 : -1;
    
    // hide the 'toView' by rotating it 90 degrees around its y-axis
    toView.layer.transform = [self yRotation:factor * -M_PI_2];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateKeyframesWithDuration:duration
                                   delay:0
                                 options:UIViewKeyframeAnimationOptionCalculationModeCubic
                              animations:^{
                                  [UIView addKeyframeWithRelativeStartTime:0
                                                          relativeDuration:0.5
                                                                animations:^{
                                                                    fromView.layer.transform = [self yRotation:factor * M_PI_2];
                                                                }];
                                  [UIView addKeyframeWithRelativeStartTime:0.5
                                                          relativeDuration:0.5
                                                                animations:^{
                                                                    toView.layer.transform = [self yRotation:0];
                                                                }];
                              } completion:^(BOOL finished) {
                                  [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
                              }];
}

@end
