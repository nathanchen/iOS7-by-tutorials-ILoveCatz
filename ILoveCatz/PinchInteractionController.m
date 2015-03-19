//
//  PinchInteractionController.m
//  ILoveCatz
//
//  Created by Nate on 19/03/2015.
//  Copyright (c) 2015 Nathan CHEN. All rights reserved.
//

#import "PinchInteractionController.h"

@implementation PinchInteractionController
{
    BOOL shouldCompleteTransition;
    UIViewController *_viewController;
    CGFloat _startScale;
}

- (void)wireToViewController: (UIViewController *)viewController
{
    _viewController = viewController;
    [self prepareGestureRecognizerInView:viewController.view];
}

- (void)prepareGestureRecognizerInView: (UIView *)view
{
    UIPinchGestureRecognizer *gesture = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
    [view addGestureRecognizer:gesture];
}

- (CGFloat)completionSeed: (CGFloat)percentComplete
{
    return 1 - percentComplete;
}

- (void)handleGesture: (UIPinchGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan)
    {
        _startScale = gestureRecognizer.scale;
        _interactionInProgress = YES;
        [_viewController dismissViewControllerAnimated:YES completion:nil];
    }
    else if (gestureRecognizer.state == UIGestureRecognizerStateChanged)
    {
        float fraction = 1 - gestureRecognizer.scale / _startScale;
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
}

@end
