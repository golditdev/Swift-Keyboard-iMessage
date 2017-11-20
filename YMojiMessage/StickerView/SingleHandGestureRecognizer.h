//
//  SingleHandGestureRecognizer.h
//  RotationView
//
//  Created by Crane on 17/1/23.
//  Copyright © 2017 GoldITDev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SingleHandGestureRecognizer : UIGestureRecognizer

@property (assign, nonatomic) CGFloat scale;
@property (assign, nonatomic) CGFloat rotation;

- (nonnull instancetype)initWithTarget:(nullable id)target action:(nullable SEL)action anchorView:(nonnull UIView *)anchorView;

- (void)reset;

@end
