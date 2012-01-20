//
//  Student.m
//  ScheduleLookup
//
//  Created by Mark Vitale on 1/20/12.
//  Copyright (c) 2012 Rose-Hulman Institute of Technology. All rights reserved.
//

#import "Student.h"

@implementation Student
@synthesize major, year;

- (Student *) initStudentWithAlias:(NSString *)newAlias 
                      WithCmNumber:(NSString *)newCmNumber  
                          WithName:(NSString *)newName 
                         WithMajor:(NSString *)newMajor 
                          WithYear:(NSString *)newYear
{
    if (self = [super initPersonWithAlias:newAlias WithCmNumber:newCmNumber  WithName:newName])
    {
        self.major = newMajor;
        self.year = newYear;
    }
    
    return self;
}

@end
