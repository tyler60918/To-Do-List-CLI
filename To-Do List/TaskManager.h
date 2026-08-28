//
//  TaskManager.h
//  To-Do List
//
//  Created by Tyler Pierce on 8/18/26.
//

#import <Foundation/Foundation.h>

@interface TaskManager : NSObject

@property (nonatomic, readonly) NSMutableArray *tasks;

-(instancetype)init;

-(void) addTask: (NSString *) title;
-(void) markComplete: (int) taskNumber;
-(void) removeTask: (int) taskNumber;
-(void) clearTasks;
-(void) listTasks;

@end
