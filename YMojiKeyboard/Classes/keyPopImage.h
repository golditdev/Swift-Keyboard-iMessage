//
//  keyPopImage.h
//  YourMoji
//
//  Created by Crane on 9/27/16.
//  Copyright © 2016 GoldITDev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define _UPPER_WIDTH   (52.0 * [[UIScreen mainScreen] scale])
#define _LOWER_WIDTH   (32.0 * [[UIScreen mainScreen] scale])

#define _PAN_UPPER_RADIUS  (7.0 * [[UIScreen mainScreen] scale])
#define _PAN_LOWER_RADIUS  (7.0 * [[UIScreen mainScreen] scale])

#define _PAN_UPPDER_WIDTH   (_UPPER_WIDTH-_PAN_UPPER_RADIUS*2)
#define _PAN_UPPER_HEIGHT    (61.0 * [[UIScreen mainScreen] scale])

#define _PAN_LOWER_WIDTH     (_LOWER_WIDTH-_PAN_LOWER_RADIUS*2)
#define _PAN_LOWER_HEIGHT    (30.0 * [[UIScreen mainScreen] scale])

#define _PAN_UL_WIDTH        ((_UPPER_WIDTH-_LOWER_WIDTH)/2)

#define _PAN_MIDDLE_HEIGHT    (11.0 * [[UIScreen mainScreen] scale])

#define _PAN_CURVE_SIZE      (7.0 * [[UIScreen mainScreen] scale])

#define _PADDING_X     (15 * [[UIScreen mainScreen] scale])
#define _PADDING_Y     (10 * [[UIScreen mainScreen] scale])
#define _WIDTH   (_UPPER_WIDTH + _PADDING_X*2)
#define _HEIGHT   (_PAN_UPPER_HEIGHT + _PAN_MIDDLE_HEIGHT + _PAN_LOWER_HEIGHT + _PADDING_Y*2)


#define _OFFSET_X    -25 * [[UIScreen mainScreen] scale])
#define _OFFSET_Y    59 * [[UIScreen mainScreen] scale])


#define __UPPER_WIDTH   (52.0 * [[UIScreen mainScreen] scale])
#define __LOWER_WIDTH   (24.0 * [[UIScreen mainScreen] scale])

#define __PAN_UPPER_RADIUS  (10.0 * [[UIScreen mainScreen] scale])
#define __PAN_LOWER_RADIUS  (5.0 * [[UIScreen mainScreen] scale])

#define __PAN_UPPDER_WIDTH   (__UPPER_WIDTH-__PAN_UPPER_RADIUS*2)
#define __PAN_UPPER_HEIGHT    (52.0 * [[UIScreen mainScreen] scale])

#define __PAN_LOWER_WIDTH     (__LOWER_WIDTH-__PAN_LOWER_RADIUS*2)
#define __PAN_LOWER_HEIGHT    (47.0 * [[UIScreen mainScreen] scale])

#define __PAN_UL_WIDTH        ((__UPPER_WIDTH-__LOWER_WIDTH)/2)

#define __PAN_MIDDLE_HEIGHT    (2.0 * [[UIScreen mainScreen] scale])

#define __PAN_CURVE_SIZE      (10.0 * [[UIScreen mainScreen] scale])

#define __PADDING_X     (15 * [[UIScreen mainScreen] scale])
#define __PADDING_Y     (10 * [[UIScreen mainScreen] scale])
#define __WIDTH   (__UPPER_WIDTH + __PADDING_X*2)
#define __HEIGHT   (__PAN_UPPER_HEIGHT + __PAN_MIDDLE_HEIGHT + __PAN_LOWER_HEIGHT + __PADDING_Y*2)


#define __OFFSET_X    -25 * [[UIScreen mainScreen] scale])
#define __OFFSET_Y    59 * [[UIScreen mainScreen] scale])

enum {
    PKNumberPadViewImageLeft = 0,
    PKNumberPadViewImageInner,
    PKNumberPadViewImageRight,
    PKNumberPadViewImageMax
};

@interface keyPopImage : NSObject



+ (UIImage *)createKeytopImageWithKind:(int)kind;
+ (UIImage *)createiOS7KeytopImageWithKind:(int)kind;
@end
