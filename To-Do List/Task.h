//
//  Task.h
//  To-Do List
//
//  Created by Tyler Pierce on 8/18/26.
//

@interface Task : NSObject

@property (nonatomic) NSString *title;
@property (nonatomic, getter=isCompleted) BOOL completed;

-(instancetype)initWithTitle: (NSString *)taskTitle;

-(NSString *)info;

@end
