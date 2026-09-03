//
//  Task.m
//  To-Do List
//
//  Created by Tyler Pierce on 8/18/26.
//

#import <Foundation/Foundation.h>
#import "Task.h"

//@interface Task()
//
//@property (nonatomic, readwrite) NSString *title;
//@property (nonatomic, getter=isCompleted) BOOL completed;
//
//@end

@implementation Task

- (instancetype)initWithTitle: (NSString *) title {
    if (self = [super init]) {
        self.title = title;
    }
    return self;
}

- (NSString *)info {
    if (self.completed) {
        return [NSString stringWithFormat:@"[x] %@", self.title];
    } else {
        return [NSString stringWithFormat:@"[ ] %@", self.title];
    }
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.title forKey:@"title"];
    [coder encodeBool:self.completed forKey:@"completed"];
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super init];
    if (self) {
        self.title = [coder decodeObjectForKey:@"title"];
        self.completed = [coder decodeBoolForKey:@"completed"];
    }
    return self;
}

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end
