//
//  MasterTableViewController.m
//  ILoveCatz
//
//  Created by Nate on 18/03/2015.
//  Copyright (c) 2015 Nathan CHEN. All rights reserved.
//

#import "MasterTableViewController.h"
#import "AppDelegate.h"
#import "Cat.h"
#import "DetailViewController.h"
#import "BouncePresentAnimationController.h"
#import "ShrinkDismissAnimationController.h"
#import "FlipAnimationController.h"
#import "SwipeInteractionController.h"

@interface MasterTableViewController ()
{
    BouncePresentAnimationController *bouncePresentAnimationController;
    ShrinkDismissAnimationController *shrinkDismissAnimationController;
    FlipAnimationController *flipAnimationController;
    SwipeInteractionController *swipeInteractionController;
}

@end

@implementation MasterTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cat"]];
    self.navigationItem.titleView = imageView;
    self.navigationController.delegate = self;
    bouncePresentAnimationController = [[BouncePresentAnimationController alloc] init];
    shrinkDismissAnimationController = [[ShrinkDismissAnimationController alloc] init];
    flipAnimationController = [[FlipAnimationController alloc] init];
    swipeInteractionController = [[SwipeInteractionController alloc] init];
}

- (NSMutableArray *)cats
{
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    return appDelegate.cats;
}

- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController
{
    return [swipeInteractionController interactionInProgress] ? swipeInteractionController : nil;
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    if (operation == UINavigationControllerOperationPush)
    {
        [swipeInteractionController wireToViewController:toVC];
    }
    flipAnimationController.reverse = operation == UINavigationControllerOperationPop;
    return flipAnimationController;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [[self cats] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = ((Cat *)[[self cats] objectAtIndex:indexPath.row]).title;
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return bouncePresentAnimationController;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return shrinkDismissAnimationController;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue identifier] isEqualToString:@"showDetail"])
    {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Cat *cat = [[self cats] objectAtIndex:indexPath.row];
        
        DetailViewController *detailVC = segue.destinationViewController;
        detailVC.cat = cat;
    }
    else if ([[segue identifier] isEqualToString:@"showAbout"])
    {
        UIViewController *toVC = [segue destinationViewController];
        toVC.transitioningDelegate = self;
    }
}


@end
