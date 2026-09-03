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

- (NSString *)filePath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, NSUserDomainMask, YES);
    NSString *appSupportDir = [paths firstObject];
    NSString *appDir = [appSupportDir stringByAppendingPathComponent:@"TodoCLI"];
    
    return [appDir stringByAppendingPathComponent:@"todo.data"];
}

-(void) addTask:(NSString *)title {
    Task *newTask = [[Task alloc] initWithTitle: title];
    [self.tasks addObject: newTask];
}

-(void) listTasks {
    if (self.tasks.count == 0) {
        NSLog(@"All tasks complete!");
        return;
    }
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

- (void) clearTasks {
    [self.tasks removeAllObjects];
}

- (void) saveToFile {
    NSString *path = [self filePath];
    NSString *directory = [path stringByDeletingLastPathComponent];
    
    [[NSFileManager defaultManager] createDirectoryAtPath:directory withIntermediateDirectories:YES attributes:nil error:nil];
    
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self.tasks requiringSecureCoding:YES error:nil];
    [data writeToFile:path atomically:YES];
}

- (void) loadFromFile {
    NSData *data = [NSData dataWithContentsOfFile:[self filePath]];
    if (data) {
        NSSet *allowedClasses = [NSSet setWithArray:@[[NSArray class], [Task class], [NSString class]]];
        NSArray *loadedTasks = [NSKeyedUnarchiver unarchivedObjectOfClasses:allowedClasses fromData:data error:nil];
        self.tasks = [loadedTasks mutableCopy];
    }
}

@end
