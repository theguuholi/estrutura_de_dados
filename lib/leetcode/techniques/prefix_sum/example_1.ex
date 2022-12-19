defmodule Leetcode.Techniques.PrefixSum.Example1 do
  def execute(nums, queries, limit) do
    {prefix, _} =
      Enum.reduce(nums, {[], 0}, fn e, {prefix, actual} ->
        actual = e + actual
        prefix = prefix ++ [actual]
        {prefix, actual}
      end)

    Enum.map(queries, fn [x, y] ->
      prefix_calc = Enum.at(prefix, y) - Enum.at(prefix, x) + Enum.at(nums, x)
      prefix_calc < limit
    end)
  end
end

# nums = [1, 6, 3, 2, 7, 2]
# queries = [[0, 3], [2, 5], [2, 4]]
# limit = 13

# var answerQueries = function(nums, queries, limit) {
#     prefix = [nums[0]]
#     for(i = 1; i < nums.length; i++){
#         prefix.push(nums[i] + prefix[i - 1])
#     }
#     console.log(prefix)

#     ans = []
#     for(const [x, y] of queries) {
#         prefix_calc = prefix[y] - prefix[x] + nums[x]
#         result = prefix_calc < limit
#         ans.push(result)
#     }
#     return ans
# }

# console.log(answerQueries(nums, queries, limit));
