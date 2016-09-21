//
//  Photo.h
//  InstaKilo
//
//  Created by Cay Cornelius on 21/09/16.
//  Copyright © 2016 Cornelius.Media. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Photo : NSObject

@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *subject;

@end
