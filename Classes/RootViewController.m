//
//  RootViewController.m
//  TableViewExtAnimations
//
//  Created by Алексеев Влад on 08.07.11.
//  Copyright 2011 beefon software. All rights reserved.
//

#import "RootViewController.h"


@implementation RootViewController

@synthesize section1 = _section1;
@synthesize section2 = _section2;
@synthesize sections = _sections;

- (NSMutableArray *)section1 {
	if (_section1 == nil) {
		_section1 = [[NSMutableArray alloc] initWithObjects:@"Hello", @"How are you?", @"I'm fine", @"thanks", nil];
	}
	return _section1;
}

- (NSMutableArray *)section2 {
	if (_section2 == nil) {
		_section2 = [[NSMutableArray alloc] initWithObjects:@"Привет", @"Как дела?", @"У меня все хорошо", @"Спасибо", nil];
	}
	return _section2;	
}

- (NSMutableArray *)sections {
	if (_sections == nil) {
		_sections = [[NSMutableArray alloc] initWithObjects:self.section1, self.section2, nil];
	}
	return _sections;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.sections count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	NSMutableArray *sectionArray = [self.sections objectAtIndex:section];
    return [sectionArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
		cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
	NSMutableArray *sectionArray = [self.sections objectAtIndex:indexPath.section];
	
	cell.textLabel.text = [sectionArray objectAtIndex:indexPath.row];
	
    return cell;
}

- (void)tableView:(UITableView *)tableView
		 moveCell:(UITableViewCell *)cell
	fromIndexPath:(NSIndexPath *)fromIndexPath
	  toIndexPath:(NSIndexPath *)toIndexPath {
	NSMutableArray *sectionArray1 = [self.sections objectAtIndex:fromIndexPath.section];
	NSMutableArray *sectionArray2 = [self.sections objectAtIndex:toIndexPath.section];
	
	NSString *stringToMove = [[[sectionArray1 objectAtIndex:fromIndexPath.row] retain] autorelease];
	[sectionArray1 removeObjectAtIndex:fromIndexPath.row];
	[sectionArray2 insertObject:stringToMove atIndex:toIndexPath.row];
}

- (void)tableView:(UITableView *)tableView 
	 exchangeCell:(UITableViewCell *)cell1 atIndexPath:(NSIndexPath *)indexPath1 
		 withCell:(UITableViewCell *)cell2 atIndexPath:(NSIndexPath *)indexPath2 {
	NSMutableArray *sectionArray1 = [self.sections objectAtIndex:indexPath1.section];
	NSMutableArray *sectionArray2 = [self.sections objectAtIndex:indexPath2.section];
	
	NSString *string1 = [[[sectionArray1 objectAtIndex:indexPath1.row] retain] autorelease];
	NSString *string2 = [[[sectionArray2 objectAtIndex:indexPath2.row] retain] autorelease];
	
	[sectionArray1 replaceObjectAtIndex:indexPath1.row withObject:string2];
	[sectionArray2 replaceObjectAtIndex:indexPath2.row withObject:string1];
	
	cell1.textLabel.text = string2;
	cell2.textLabel.text = string1;
}

- (void)tableView:(UITableView *)tableView transitionDeletedCellForRowAtIndexPath:(NSIndexPath *)indexPath {
	NSMutableArray *sectionArray = [self.sections objectAtIndex:indexPath.section];
	[sectionArray removeObjectAtIndex:indexPath.row];
}

- (void)tableView:(UITableView *)tableView transitionInsertedCellForRowAtIndexPath:(NSIndexPath *)indexPath {
	NSMutableArray *sectionArray = [self.sections objectAtIndex:indexPath.section];
	[sectionArray insertObject:@"TRANSITION CELL" atIndex:indexPath.row];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
}

- (IBAction)exchange {
	[self.tableView exchangeRowAtIndexPath:[NSIndexPath indexPathForRow:3 inSection:0]
						withRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:1]];
}

- (IBAction)move {
	[self.tableView moveRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] 
						   toIndexPath:[NSIndexPath indexPathForRow:4 inSection:1]];
}

- (IBAction)transition {
	[self.tableView transitRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] 
						   toRowIndexPath:[NSIndexPath indexPathForRow:2 inSection:1]];
}

#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {

}


- (void)dealloc {
    [super dealloc];
}


@end

