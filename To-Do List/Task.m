//
//  Task.m
//  To-Do List
//
//  Created by Tyler Pierce on 8/18/26.
//

#import <Foundation/Foundation.h>
#import "Task.h"

@interface Task()

@property (nonatomic, readwrite) NSString *title;
@property (nonatomic, readwrite, getter=isCompleted) BOOL completed;

@end

@implementation Task

- (instancetype)initWithTitle: (NSString *) title {
    if (self = [super init]) {
        self.title = title;
    }
    return self;
}

- (void)info {
    if (self.completed) {
        NSLog(@"[x] %@", self.title);
    } else {
        NSLog(@"[ ] %@", self.title);
    }
}

@end
