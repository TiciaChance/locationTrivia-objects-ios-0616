//
//  FISLocation.m
//  locationTrivia-Objects
//
//  Created by Flatiron School on 6/13/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISLocation.h"
#import "FISTrivium.h"

@implementation FISLocation

- (instancetype)init {
    
    return [self initWithName:@"" latitude:0 longitude:0];
}

-(instancetype) initWithName:(NSString *) name latitude: (CGFloat) latitude longitude: (CGFloat) longitude {
    _name = name;
    _latitude = latitude;
    _longitude =longitude;
    _trivia = [[NSMutableArray alloc] init];
    
    //self.trivia = [[NSMutableArray alloc] init];
    return self;
}
-(NSString *) stringByTruncatingNameToLength: (NSUInteger) length {
    
    NSString *newName = self.name;
    
    
    if(length > newName.length) {
        return newName;
    } else {
        return [newName substringToIndex:length];
    }
    
    NSLog(@"\n\n%@\n\n", self.name);
    
    return newName;
    
}
-(BOOL) hasValidData {
    
    if([self.name isEqualToString:@""] || self.name.length == 0) {
        return 0;
    }
    
    if (self.latitude < -90.0 || self.latitude > 90.0 || self.longitude <= -180.0 || self.longitude >= 180.0){
        return 0;
    }
    return 1;
}
-(FISTrivium *) triviumWithMostLikes {
    
    // when i access a prop it has to be on instance and not the class
    if (self.trivia.count == 0) {
        return nil;
    }

    NSSortDescriptor *sortByLikes = [[NSSortDescriptor alloc] initWithKey:@"likes" ascending:NO];
    NSArray *descriptors = @[sortByLikes];
    NSArray *sortedArray = [self.trivia sortedArrayUsingDescriptors:descriptors];

    return sortedArray[0];
}

@end
