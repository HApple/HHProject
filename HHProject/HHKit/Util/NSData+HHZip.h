//
//  NSData+HHZip.h
//  HHProject
//
//  Created by Jn.Huang on 2017/6/5.
//  Copyright © 2017年 huang. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN

@interface NSData (HHZip)
/**
 Decompress data from gzip data.
 @return Inflated data.
 */
- (nullable NSData *)hh_gzipInflate;

/**
 Comperss data to gzip in default compresssion level.
 @return Deflated data.
 */
- (nullable NSData *)hh_gzipDeflate;

/**
 Decompress data from zlib-compressed data.
 @return Inflated data.
 */
- (nullable NSData *)hh_zlibInflate;

/**
 Comperss data to zlib-compressed in default compresssion level.
 @return Deflated data.
 */
- (nullable NSData *)hh_zlibDeflate;

@end

NS_ASSUME_NONNULL_END
