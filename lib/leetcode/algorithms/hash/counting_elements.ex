defmodule Leetcode.Algorithms.Hash.CountingElements do
  def execute(arr) do
    # O(n*2)
    # Enum.reduce(arr, 0, fn e, acc ->
    #   next = e + 1
    #   if Enum.find(arr, false, &(&1 == next)), do: acc+1, else: acc
    # end)

    {_, hash} =
      Enum.reduce(arr, {0, %{}}, fn e, {i, hash} ->
        {i + 1, Map.put(hash, e, i)}
      end)

    Enum.reduce(arr, 0, fn e, acc ->
      e = Map.get(hash, e + 1)

      if !is_nil(e) do
        acc + 1
      else
        acc
      end
    end)
  end
end

# Set<Integer> hashSet = new HashSet<>();
# for (int x : arr) {
#     hashSet.add(x);
# }
# int count = 0;
# for (int x : arr) {
#     if (hashSet.contains(x + 1)) {
#         count++;
#     }
# }
# return count;
