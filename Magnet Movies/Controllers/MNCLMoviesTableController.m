//
//  MNCLMoviesTableController.m
//  Magnet Movies
//
//  Created by Camilo Castro on 06-09-16.
//  Copyright © 2016 Magnet SPA. All rights reserved.
//

#import "MNCLMoviesTableController.h"

#import "MNCLMovieModel.h"
#import "MNCLMovieItemMantle.h"
#import "MNCLMovieCellLoader.h"

#import "NJSLogger.h"

#import <Realm/Realm.h>

@interface MNCLMoviesTableController()

@property (nonatomic, nonnull) RLMNotificationToken * notification;

@end

@implementation MNCLMoviesTableController

#pragma mark - View Lifecycle

- (void) viewDidLoad {
    
    [super viewDidLoad];
    
    [[MNCLMovieModel fetchTopRatedMovies]
     continueWithBlock:^id _Nullable(BFTask<RLMResults *> * _Nonnull t) {
        
        if (t.error) {
            DDLogWarn(@"Failed to Fetch Movies %@", t.error);
        }
         
        return t;
    }];
    
    [self setupRealmNotification];
}

- (RLMResults *) items {
    return [MNCLMovieModel items];
}

- (void) setupRealmNotification {
    
    // Set realm notification block
    // See https://realm.io/docs/objc/latest/#notifications
    
    __weak typeof(self) weakSelf = self;
    
    self.notification = [RLMRealm.defaultRealm
                         addNotificationBlock:^(NSString *note,
                                                RLMRealm *realm) {
                             
                             [weakSelf reloadData];
                         }];
    
}

- (void) reloadData {
    [self.tableView reloadData];
}

#pragma mark - Table View

#pragma mark DataSource
- (NSInteger) tableView:(UITableView *)tableView
  numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (UITableViewCell *) tableView:(UITableView *) tableView
          cellForRowAtIndexPath:(NSIndexPath *) indexPath {
    
    MNCLMovieModel * movie = self.items[indexPath.row];
    
    // We use the Strategy Design Pattern
    // for loading the cells and not clutter
    // the view controller
    UITableViewCell * cell = [MNCLMovieCellLoader
                              cellForMovie:movie
                              inTableView:tableView
                              atIndexPath:indexPath];
    
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView
    heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    MNCLMovieModel * movie = self.items[indexPath.row];

    return [MNCLMovieCellLoader heightForMovie:movie];
}

#pragma mark Delegate
- (void) tableView:(UITableView *) tableView
    didSelectRowAtIndexPath:(NSIndexPath *) indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
@end
