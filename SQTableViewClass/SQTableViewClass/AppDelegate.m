//
//  AppDelegate.m
//  SQTableViewClass
//
//  Created by XinJinquan on 2016/1/20.
//  Copyright © 2016年 XinJinquan. All rights reserved.
//

#import "AppDelegate.h"
#import "Movie.h"
@interface AppDelegate ()<NSTableViewDataSource, NSTableViewDelegate>

@property (weak) IBOutlet NSWindow *window;
@property (nonatomic, copy) NSArray *movies;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}
- (IBAction)table:(id)sender {
}
- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
    return [_movies count];
}
- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    NSTableCellView *cell = (NSTableCellView *)[tableView makeViewWithIdentifier:tableColumn.identifier owner:self];
    
    NSTextField *textField =  cell.textField;
    Movie *moves = _movies[row];
    if ([tableColumn.identifier isEqualToString:@"one"]) {
        
        textField.stringValue = moves.title;
    } else if ([tableColumn.identifier isEqualToString:@"two"]) {
        float duration = moves.duration;
        textField.stringValue = [NSString stringWithFormat:@"%2d:%2d", (int)(duration/60), (int)duration%60];
    }
    return cell;
}
//排序
- (void)tableView:(NSTableView *)tableView
            sortDescriptorsDidChange:(NSArray<NSSortDescriptor *> *)oldDescriptors
{
    for (NSSortDescriptor *descitptor in [[tableView sortDescriptors]reverseObjectEnumerator]) {
       // _movies = [_movies sortedArrayUsingDescriptors:[NSArray arrayWithObject:descitptor]];
        _movies =  [_movies sortedArrayUsingComparator:^NSComparisonResult(id   obj1, id   obj2) {
            return [descitptor compareObject:obj1 toObject:obj2];
        }];

    }
   
    [tableView reloadData];
}
- (void)awakeFromNib
{
    _movies = [Movie movies];
    for (Movie * m in _movies) {
        NSLog(@"title : %@",m.title);
    }
}
- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
