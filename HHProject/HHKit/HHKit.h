//
//  HHKit.h
//

#ifndef HHKit_h
#define HHKit_h

//app delegate
//#import "AppDelegate.h"

//Pods
#import <YYKit/YYKit.h>
#define MAS_SHORTHAND_GLOBALS
#import <Masonry/Masonry.h>
#import <MJRefresh.h>
#import <MBProgressHUD.h>
#import <UIImageView+WebCache.h>
#import <UINavigationController+FDFullscreenPopGesture.h>
#import <UITableView+FDTemplateLayoutCell.h>
#import <MMPopupView.h>
#import <LYEmptyView.h>
#import <LGAlertView.h>
#import <ReactiveCocoa/ReactiveCocoa.h>
#import <ReactiveCocoa/RACReturnSignal.h>

//General
#import "HHLoadPageDataProtocol.h"

//RAC_MVVM_Example
#import "RAC_MVVM_Header.h"


//Util
#import "HHKitMacro.h"
#import "AppUIDefine.h"
#import "NSDate+HHUtilities.h"
#import "NSData+HHZip.h"
#import "NSString+HHRegular.h"
#import "UIColor+HHHex.h"
#import "UILabel+HHUtilities.h"
#import "UIScreen+HHUtilities.h"
#import "NSString+HHCheck.h"
#import "UIViewController+HHUtilities.h"
#import "HHProgressHUD.h"

//TCP
#import "HHNetworkHelper.h"

//Encryptions
#import "NSString+Hash.h"
#import "CocoaSecurity.h"

#endif /* HHKit_h */
