/*
 704. 二分查找
 给定一个 n 个元素有序的（升序）整型数组 nums 和一个目标值 target ，写一个函数搜索 nums 中的 target，如果目标值存在返回下标，否则返回 -1。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/binary-search
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution1 {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count - 1
        while (left <= right) {
            let mid = left + (right - left) / 2
            if target == nums[mid] {
                return mid
            } else if target < nums[mid] {
                right = mid - 1
            } else if target > nums[mid] {
                left = mid + 1
            }
        }
        return -1
    }
}
Solution1().search([-1], -1)
Solution1().search([-1, 2, 4, 10, 30, 99], 4)

/*
 278. 第一个错误的版本
 你是产品经理，目前正在带领一个团队开发新的产品。不幸的是，你的产品的最新版本没有通过质量检测。由于每个版本都是基于之前的版本开发的，所以错误的版本之后的所有版本都是错的。

 假设你有 n 个版本 [1, 2, ..., n]，你想找出导致之后所有版本出错的第一个错误的版本。

 你可以通过调用 bool isBadVersion(version) 接口来判断版本号 version 是否在单元测试中出错。实现一个函数来查找第一个错误的版本。你应该尽量减少对调用 API 的次数。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/first-bad-version
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class VersionControl {
    func isBadVersion(_ version: Int) -> Bool {
        return version >= 4
    }
}

class Solution2: VersionControl {
    func firstBadVersion(_ n: Int) -> Int {
        var left = 1, right = n
        // 循环直至区间左右端点相同
        while left < right {
            let mid = left + (right - left) / 2
            if isBadVersion(mid) {
                // 错误版本在[left,mid]区间内
                right = mid;
            } else {
                // 错误版本在[mid+1,right]
                left = mid + 1;
            }
        }
        // 此时有 left == right，区间缩为一个点，即为答案
        return left
    }
}
Solution2().firstBadVersion(5)

/*
 35. 搜索插入位置
 给定一个排序数组和一个目标值，在数组中找到目标值，并返回其索引。如果目标值不存在于数组中，返回它将会被按顺序插入的位置。

 请必须使用时间复杂度为 O(log n) 的算法。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/search-insert-position
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
class Solution3 {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        if let index = nums.firstIndex(of: target) {
            return index
        }
        for (index, value) in nums.enumerated() {
            if value >= target {
                return index
            }
        }
        return nums.count
    }
    
    func searchInsert2(_ nums: [Int], _ target: Int) -> Int {
        var left = 0, right = nums.count - 1
        while left <= right {
            let mid = left + (right - left) / 2
            if nums[mid] < target {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        return left
    }
}

Solution3().searchInsert([1,3,5,6,8], 7)
