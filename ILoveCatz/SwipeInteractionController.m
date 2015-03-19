//
//  SwipeInteractionController.m
//  ILoveCatz
//
//  Created by Nate on 18/03/2015.
//  Copyright (c) 2015 Nathan CHEN. All rights reserved.
//

#import "SwipeInteractionController.h"

@implementation SwipeInteractionController
{
    BOOL shouldCompleteTransition;
    UINavigationController *navigationController;
}

- (void)wireToViewController: (UIViewController *)viewController
{
    navigationController = viewController.navigationController;
    [self prepareGestureRecognizerInView:viewController.view];
}

- (void)prepareGestureRecognizerInView: (UIView *)view
{
    UIPanGestureRecognizer *gesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
    [view addGestureRecognizer:gesture];
}

- (void)handleGesture: (UIPanGestureRecognizer *)gestureRecognizer
{
    CGPoint translation = [gestureRecognizer translationInView:gestureRecognizer.view.superview];
    float fraction = translation.x / 200.0;
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan)
    {
        _interactionInProgress = YES;
        [navigationController popViewControllerAnimated:YES];
    }
    else if (gestureRecognizer.state == UIGestureRecognizerStateChanged)
    {
        fraction = (CGFloat)(fminf(fmaxf(fraction, 0.0), 1.0));
        shouldCompleteTransition = fraction > 0.5;
        [self updateInteractiveTransition:fraction];
    }
    else if (gestureRecognizer.state == UIGestureRecognizerStateEnded || gestureRecognizer.state == UIGestureRecognizerStateCancelled)
    {
        _interactionInProgress = NO;
        if (!shouldCompleteTransition || gestureRecognizer.state == UIGestureRecognizerStateCancelled)
        {
            [self cancelInteractiveTransition];
        }
        else
        {
            [self finishInteractiveTransition];
        }
    }
    else
    {
        NSLog(@"Unsupported state");
    }
}

- (CGFloat)completionSpeed: (CGFloat)percentComplete
{
    return 1 - percentComplete;
}

@end
