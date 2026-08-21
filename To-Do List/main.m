//
//  main.m
//  To-Do List
//
//  Created by Tyler Pierce on 8/18/26.
//

#import <Foundation/Foundation.h>
#import "TaskManager.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TaskManager *taskManager = [[TaskManager alloc] init];
        [taskManager addTask:@"Wash Dishes"];
        [taskManager addTask:@"Read Book"];
        [taskManager listTasks];
    }
    return EXIT_SUCCESS;
}
