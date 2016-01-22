//
//  Movie.m
//  SQTableViewClass
//
//  Created by XinJinquan on 2016/1/20.
//  Copyright © 2016年 XinJinquan. All rights reserved.
//

#import "Movie.h"

@implementation Movie

- (instancetype)initWithTile:(NSString *)title duration:(float)douraiton
{
    self = [super init];
    if (self) {
        _duration = douraiton;
        _title = title;
    }
    return self;
}
- (id)copyWithZone:(NSZone *)zone
{
    Movie *movie = [[Movie allocWithZone:zone]initWithTile:_title duration:_duration];
    return movie;
}
+ (NSArray *)movies {
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    Movie *movies = [[Movie alloc]initWithTile:@"美人" duration:140];
    
    [arr addObject:movies];
    Movie *moives2 = [movies copy];
    moives2.title = @"超人";
    moives2.duration = 122;
    [arr addObject:moives2];
    return arr ;
}
@end
