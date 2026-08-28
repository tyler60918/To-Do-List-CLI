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

-(instancetype) init {
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
    for (int i = 0; i < self.tasks.count; i++) {
        NSLog(@"%d. %@", (i + 1), [self.tasks[i] info]);
    }
}

- (void) markComplete:(int)taskNumber {
    if (taskNumber <= 0 || taskNumber > self.tasks.count) {
        NSLog(@"Invalid task number: %d", taskNumber);
        return;
    }
    Task *task = self.tasks[taskNumber - 1];
    [task setCompleted:YES];
}

- (void) removeTask:(int)taskNumber {
    if (taskNumber <= 0 || taskNumber > self.tasks.count) {
        NSLog(@"Invalid task number: %d", taskNumber);
        return;
    }
    [self.tasks removeObjectAtIndex:(taskNumber - 1)];
}

@end
