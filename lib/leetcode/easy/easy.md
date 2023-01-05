# 1 ============

Given a sorted array of distinct integers and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.
You must write an algorithm with O(log n) runtime complexity.

Example 1:
Input: nums = [1,3,5,6], target = 5
Output: 2

## JS
var searchInsert = function(nums, target) {
        target_index = 0
    for(i = 0; i < nums.length; i++) {
        if(target < nums[i]){
            break;
        }
        if(target === nums[i]){
            break;
        }
        target_index++
    }
    return target_index;
};

## Elixir
defmodule Solution do
  def search_insert(nums, target) do
    Enum.reduce_while(nums, 0, fn e, i -> 
        cond do
            target < e -> {:halt, i}
            target == e -> {:halt, i}
            true -> {:cont, i + 1}
        end
    end)
  end
end

===========================
# 2 
Given a string s consisting of words and spaces, return the length of the last word in the string.
A word is a maximal substring consisting of non-space characters only.

Example 1:
Input: s = "Hello World"
Output: 5

## Elixir
defmodule Solution do
  def length_of_last_word(s) do
    s
    |> String.split(" ", trim: true)
    |> Enum.reverse
    |> hd
    |> String.length
  end
end

## JS
