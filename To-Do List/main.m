//
//  main.m
//  To-Do List
//
//  Created by Tyler Pierce on 8/18/26.
//

#import <Foundation/Foundation.h>
#import "TaskManager.h"

NSString *readLineFromInput(void) {
    NSFileHandle *input = [NSFileHandle fileHandleWithStandardInput];
    NSData *inputData = [input availableData];
    NSString *line = [[NSString alloc] initWithData:inputData encoding:NSUTF8StringEncoding];
    line = [line stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return line;
}

void printMenu(void) {
    printf("Available commands:\n");
    printf("  add <task>          Add a new task\n");
    printf("  list                List all tasks\n");
    printf("  complete <task #>   Mark a task complete\n");
    printf("  remove <task #>     Remove a task\n");
    printf("  clear               Clears all tasks\n");
    printf("  help                Show this menu\n");
    printf("  quit                Save and exit\n");
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TaskManager *taskManager = [[TaskManager alloc] init];
        BOOL isRunning = YES;
        
        while (isRunning) {
            printf("> "); // prompt
            
            NSString *line = readLineFromInput();
            
            NSRange spaceRange = [line rangeOfString:@" "];
            
            NSString *command;
            NSString *argument;
            
            if (spaceRange.location != NSNotFound) {
                command = [line substringToIndex:spaceRange.location];
                argument = [line substringFromIndex:spaceRange.location + 1];
            } else {
                command = line;
                argument = @"";
            }
            command = [command lowercaseString];
            
            if ([command isEqualToString:@"add"]) {
                [taskManager addTask:argument];
            } else if ([command isEqualToString:@"list"]) {
                [taskManager listTasks];
            } else if ([command isEqualToString:@"complete"]) {
                [taskManager markComplete:[argument intValue]];
            } else if ([command isEqualToString:@"remove"]) {
                [taskManager removeTask:[argument intValue]];
            } else if ([command isEqualToString:@"clear"]) {
                [taskManager clearTasks];
            } else if ([command isEqualToString:@"quit"] || [command isEqualToString:@"exit"]) {
                isRunning = NO;
            } else if ([command isEqualToString:@"help"]) {
                printMenu();
            } else {
                printf("Unknown command: %s\n", [command UTF8String]);
            }
        }
        
        
//        [taskManager addTask:@"Wash Dishes"];
//        [taskManager addTask:@"Read Book"];
//        [taskManager listTasks];
//        [taskManager markComplete:1];
//        [taskManager listTasks];
//        [taskManager removeTask:1];
//        [taskManager listTasks];
//        [taskManager addTask:@"Code"];
//        [taskManager listTasks];
//        [taskManager clearTasks];
//        [taskManager listTasks];
    }
    return EXIT_SUCCESS;
}

