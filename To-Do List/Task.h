//
//  Task.h
//  To-Do List
//
//  Created by Tyler Pierce on 8/18/26.
//

@interface Task : NSObject

@property (nonatomic, readonly) NSString *title;
@property (nonatomic, readonly, getter=isCompleted) BOOL completed;

-(instancetype)initWithTitle: (NSString *)taskTitle;

-(void)info;

@end
