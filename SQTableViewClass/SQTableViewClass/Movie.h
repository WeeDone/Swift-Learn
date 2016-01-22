//
//  Movie.h
//  SQTableViewClass
//
//  Created by XinJinquan on 2016/1/20.
//  Copyright © 2016年 XinJinquan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Movie : NSObject <NSCopying>
@property (nonatomic, copy)NSString *title;
@property (nonatomic, assign) float duration;
+ (NSArray *)movies;
@end
