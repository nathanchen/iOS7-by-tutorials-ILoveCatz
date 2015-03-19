//
//  SwipeInteractionController.h
//  ILoveCatz
//
//  Created by Nate on 18/03/2015.
//  Copyright (c) 2015 Nathan CHEN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SwipeInteractionController : UIPercentDrivenInteractiveTransition

@property (nonatomic) BOOL interactionInProgress;

- (void)wireToViewController: (UIViewController *)viewController;

@end
