defmodule Leetcode.Easy.ClimbStairs do
  # Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?

  def execute(n) do
    cache = %{0 => 1, 1 => 1}

    if n <= 1 do
      1
    else
      cache =
        Enum.reduce(2..n, cache, fn e, cache ->
          value = Map.get(cache, e - 1) + Map.get(cache, e - 2)
          Map.put(cache, e, value)
        end)
      Map.get(cache, n)
    end
  end
end

# var climbStairs = function(n) {
#   let cache = {
#   0: 1,
#   1: 1
# }

# if(n <= 1) return cache[n]

# for(let i = 2; i <= n; i++){
#   cache[i] = cache[i-1] + cache[i-2]

# }

# return cache[n]
# };
