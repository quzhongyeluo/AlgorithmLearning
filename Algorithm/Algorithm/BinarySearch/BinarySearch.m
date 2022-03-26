//
//  BinarySearch.m
//  Algorithm
//
//  Created by 曲终叶落 on 2022/3/27.
//

#import "BinarySearch.h"

@implementation BinarySearch

+ (void)start {
    NSInteger index = [self searchIndexWithNums:[NSArray arrayWithObjects: @-1, @2, @4, @10, @30, @99, nil] tagrget:4];
    NSLog(@"SearchIndex: %ld", (long)index);
    
    NSInteger version = [self firstBadVersionWithVersionNum:5];
    NSLog(@"FirstBadVersion: %ld", (long)version);
    
    NSInteger insertIndex = [self searchInsertWithNums:[NSArray arrayWithObjects: @1, @3, @5, @7, nil] tagrget:2];
    NSLog(@"SearchInsert: %ld", (long)insertIndex);
}

/*
 704. 二分查找
 给定一个 n 个元素有序的（升序）整型数组 nums 和一个目标值 target ，写一个函数搜索 nums 中的 target，如果目标值存在返回下标，否则返回 -1。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/binary-search
 */
+ (NSInteger)searchIndexWithNums: (NSArray *)nums tagrget: (NSInteger)tagrget {
    NSInteger left = 0;
    NSInteger right = nums.count - 1;
    while (left <= right) {
        NSInteger mid = left + (right - left) / 2;
        if (tagrget == [nums[mid] intValue]) {
            return mid;
        } else if (tagrget < [nums[mid] intValue]) {
            right = mid - 1;
        } else if (tagrget > [nums[mid] intValue]) {
            left = mid + 1;
        }
    }
    return -1;
}

/*
 278. 第一个错误的版本
 你是产品经理，目前正在带领一个团队开发新的产品。不幸的是，你的产品的最新版本没有通过质量检测。由于每个版本都是基于之前的版本开发的，所以错误的版本之后的所有版本都是错的。

 假设你有 n 个版本 [1, 2, ..., n]，你想找出导致之后所有版本出错的第一个错误的版本。

 你可以通过调用 bool isBadVersion(version) 接口来判断版本号 version 是否在单元测试中出错。实现一个函数来查找第一个错误的版本。你应该尽量减少对调用 API 的次数。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/first-bad-version
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
+ (NSInteger)firstBadVersionWithVersionNum: (NSInteger)version {
    NSInteger left = 1, right = version;
    while (left < right) {
        NSInteger mid = left + (right - left) / 2;
        if ([self isBadVersion:mid]) {
            right = mid;
        } else {
            left = mid + 1;
        }
    }
    return left;
}

+ (BOOL)isBadVersion: (NSInteger)version {
    return version >= 4;
}


/*
 35. 搜索插入位置
 给定一个排序数组和一个目标值，在数组中找到目标值，并返回其索引。如果目标值不存在于数组中，返回它将会被按顺序插入的位置。

 请必须使用时间复杂度为 O(log n) 的算法。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/search-insert-position
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
+ (NSInteger)searchInsertWithNums: (NSArray *)nums tagrget: (NSInteger)tagrget {
    NSInteger left = 0, right = nums.count - 1;
    while (left <= right) {
        NSInteger mid = left + (right - left) / 2;
        if (tagrget < [nums[mid] intValue]) {
            right = mid - 1;
        } else {
            left = mid + 1;
        }
    }
    return left;
}
@end
