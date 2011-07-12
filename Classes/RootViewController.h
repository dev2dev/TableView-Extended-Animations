//
//  RootViewController.h
//  TableViewExtAnimations
//
//  Created by Алексеев Влад on 08.07.11.
//  Copyright 2011 beefon software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UITableView+ExtendedAnimations.h"

@interface RootViewController : UITableViewController <UITableViewExtendedDelegate> {
	NSMutableArray *_section1;
	NSMutableArray *_section2;
	NSMutableArray *_sections;
}
@property (nonatomic, retain) NSMutableArray *section1;
@property (nonatomic, retain) NSMutableArray *section2;
@property (nonatomic, retain) NSMutableArray *sections;

- (IBAction)exchange;
- (IBAction)move;
- (IBAction)transition;

@end
