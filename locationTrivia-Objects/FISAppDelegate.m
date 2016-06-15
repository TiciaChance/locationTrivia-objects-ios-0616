//  FISAppDelegate.m

#import "FISAppDelegate.h"
#import "FISLocation.h"


@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

-(NSArray *) allLocationNames {
    
    // return an array of all of the name string properties | of the FISLocation objects held in the locations array property.
    
    NSMutableArray *nameOfLocations = [[NSMutableArray alloc]init];
    for (FISLocation *place in self.locations) {
        [nameOfLocations addObject:place.name];
    }
    return nameOfLocations;
}
-(FISLocation *)locationNamed: (NSString *) name {
    
    FISLocation *matchLocation = [[FISLocation alloc]init];
    for (FISLocation *location in self.locations){
        
        if ([location.name isEqualToString: name]){
            return matchLocation = location;
        }
        
    }
    
    return nil;
}


-(NSArray *) locationsNearLatitude: (CGFloat) latitude longitude: (CGFloat) longitude margin: (CGFloat) margin {
    
    
    NSMutableArray *nameOfLocations = [[NSMutableArray alloc]init];

    for (FISLocation *location in self.locations){
        
            if (location.latitude >= longitude - margin && location.latitude <= latitude + margin && location && location.longitude >= longitude - margin && location.longitude <= longitude + margin) {
                [nameOfLocations addObject:location];
            }
        }
    return nameOfLocations;
}

//NSLog(@"\n\n\n this is the property latitude: %f this is the property longitude: %f \n\n\n", location.latitude, location.longitude);
//NSLog(@"\n\n\n this is the latitude: %f this is the longitude: %f \n\n\n", latitude, longitude);
@end
