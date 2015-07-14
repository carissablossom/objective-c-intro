//
//  ToDoItem.h
//  ToDoList
//
//  Created by Carissa Blossom on 11/7/15.
//  Copyright (c) 2015 Carissa Blossom. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDoItem : NSObject

@property NSString *itemName;
@property BOOL completed;
@property (readonly) NSDate *creationDate;

@end
