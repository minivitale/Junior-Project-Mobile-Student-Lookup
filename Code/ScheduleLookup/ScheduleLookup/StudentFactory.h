//
//  Factory.h
//  ScheduleLookup
//
//  Created by Mark Vitale on 1/26/12.
//  Copyright (c) 2012 Rose-Hulman Institute of Technology. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"
#import "Factory.h"

@interface StudentFactory : Factory

+ (Student *) studentFromStudentSchedulePage:(NSString *) html;

+ (NSString *) advisorFromStringData:(NSString *)sdata;



@end