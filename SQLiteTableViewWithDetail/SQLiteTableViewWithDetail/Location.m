//
//  Location.m
//  SQLiteTableView
//
//  Created by Michael Shafae on 11/8/12.
//  Copyright (c) 2012 Michael Shafae. All rights reserved.
//

#import "Location.h"

@implementation Location

@synthesize country;
@synthesize city;
@synthesize accentCity;
@synthesize region;
@synthesize population;
@synthesize coord;

- (id) initWithCounty: (NSString*) theCountry andCity: (NSString*) theCity andAccentCity: (NSString*) theAccentCity andRegion: (NSString*) theRegion andPopulation: (int) thePopulation andCoordinate: (CLLocationCoordinate2D) theCoordinate;
{
  self = [super init];
  if( self ){
    country = theCountry;
    city = theCity;
    accentCity = theAccentCity;
    region = theRegion;
    population = [NSNumber numberWithInt:thePopulation];
    coord = CLLocationCoordinate2DMake(theCoordinate.longitude, theCoordinate.latitude);
  }
  return self;
}

- (NSString*) description
{
  return [NSString stringWithFormat:@"%@ %@ %@ %d %g %g", city, region, country, [population integerValue], coord.latitude, coord.longitude];
}

- (NSString*) longitudeString{
  double theta = coord.longitude;
  double deg = floor(theta);
  double min = floor((theta - deg) * 60.0);
  double sec = floor((theta - deg - (min/60.0)) * 3600.0);
  return [NSString stringWithFormat: @"%g° %g' %g\"", deg, min, sec];
}

- (NSString*) latitudeString{
  double theta = coord.latitude;
  double deg = floor(theta);
  double min = floor((theta - deg) * 60.0);
  double sec = floor((theta - deg - (min/60.0)) * 3600.0);
  return [NSString stringWithFormat: @"%g° %g' %g\"", deg, min, sec];
}

@end
