
#import <Foundation/Foundation.h>
#import "pinyin.h"

@interface ChineseString : NSObject
@property(strong,nonatomic)NSString *string;
@property(strong,nonatomic)NSString *pinYin;

//-----  返回tableview右方indexArray
+(NSMutableArray*)indexArray:(NSArray*)stringArr;

//-----  返回联系人
+(NSMutableArray*)letterSortArray:(NSArray*)stringArr;

///----------------------
//返回一组字母排序数组(中英混排)
+(NSMutableArray*)sortArray:(NSArray*)stringArr;

@end
