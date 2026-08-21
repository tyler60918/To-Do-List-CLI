//
//  TaskManager.m
//  To-Do List
//
//  Created by Tyler Pierce on 8/18/26.
//

#import <Foundation/Foundation.h>
#import "TaskManager.h"
#import "Task.h"

@interface TaskManager()

@property (nonatomic, readwrite) NSMutableArray *tasks;

@end

@implementation TaskManager

-(instancetype)init {
    if (self = [super init]) {
        self.tasks = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void) addTask:(NSString *)title {
    Task *newTask = [[Task alloc] initWithTitle: title];
    [self.tasks addObject: newTask];
}

-(void) listTasks {
    NSLog(@"Tasks:");
    for (Task *task in self.tasks) {
        NSLog(@"%@", [task info]);
    }
}

@end

