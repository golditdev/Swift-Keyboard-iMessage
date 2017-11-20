//
//  StickerView.h
//  StickerDemo
//
//  Created by Crane on 17/1/26.
//  Copyright © 2017 GoldITDev. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol StickerViewDelegate;

@interface StickerView : UIView

@property (assign, nonatomic) BOOL enabledControl; // determine the control view is shown or not, default is YES
@property (assign, nonatomic) BOOL enabledDeleteControl; // default is YES
@property (assign, nonatomic) BOOL enabledShakeAnimation; // default is YES
@property (assign, nonatomic) BOOL enabledBorder; // default is YES

@property (strong, nonatomic) UIImageView *contentView;
@property (strong, nonatomic) UIImage *contentImage;
@property (assign, nonatomic) id<StickerViewDelegate> delegate;

- (instancetype)initWithContentFrame:(CGRect)frame contentImage:(UIImage *)contentImage;

- (void)performTapOperation;

@end

@protocol StickerViewDelegate <NSObject>

@optional

- (void)stickerViewDidTapContentView:(StickerView *)stickerView;

- (void)stickerViewDidTapDeleteControl:(StickerView *)stickerView;

- (UIImage *)stickerView:(StickerView *)stickerView imageForRightTopControl:(CGSize)recommendedSize;

- (void)stickerViewDidTapRightTopControl:(StickerView *)stickerView; // Effective when resource is provided.

- (UIImage *)stickerView:(StickerView *)stickerView imageForLeftBottomControl:(CGSize)recommendedSize;

- (void)stickerViewDidTapLeftBottomControl:(StickerView *)stickerView; // Effective when resource is provided.

@end
