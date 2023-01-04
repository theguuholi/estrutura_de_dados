defmodule Leetcode.Easy.RemoveDuplicates do
  def execute(nums) do
    nums |> Enum.uniq()
  end
end
