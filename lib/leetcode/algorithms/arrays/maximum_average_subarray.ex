# JS 1
# nums = [1,12,-5,-6,50,3]
# k = 4

# maxAverage = function(nums, k) {
#      sum = [];
#      sum.push(nums[1])
#      for(i = 0; i < nums.length; i++) {
#         sumLastIndex = sum[i - 1] == null ? 0 : sum[i - 1];
#         sum[i] = sumLastIndex + nums[i];
#     }
#     console.log(sum)
#     res = sum[k - 1] * 1.0 / k;
#     for (i = k; i < nums.length; i++) {
#      res = Math.max(res, (sum[i] - sum[i - k]) * 1.0 / k);
#     }
#   return res;
# }
# // Log to console
# console.log(maxAverage(nums, k))

# findMaxAverage = function(nums, k) {
#   sum = 0;
#   for(i = 0; i < k; i++)
#       sum += nums[i];

#   res = sum
#   for(i = k; i < nums.length; i++) {
#       sum += nums[i]-nums[i-k];
#       res=Math.max(res,sum);
#   }
#   return res/k;
# }
# nums = [1,12,-5,-6,50,3], k = 4
# console.log(findMaxAverage(nums, k))
