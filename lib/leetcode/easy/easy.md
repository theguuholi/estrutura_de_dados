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

var lengthOfLastWord = function(s) {
    return s.trim().split(' ').at(-1).length
};


==============
# 3
You are given a large integer represented as an integer array digits, where each digits[i] is the ith digit of the integer. The digits are ordered from most significant to least significant in left-to-right order. The large integer does not contain any leading 0's.

Increment the large integer by one and return the resulting array of digits.

Example 1:

Input: digits = [1,2,3]
Output: [1,2,4]
Explanation: The array represents the integer 123.
Incrementing by one gives 123 + 1 = 124.
Thus, the result should be [1,2,4].


## Elixir

  def plus_one(digits) do
    digits
    |> Enum.map(&Integer.to_string/1) 
    |> List.to_string 
    |> String.to_integer 
    |> Kernel.+(1) 
    |> Integer.to_string 
    |> String.codepoints 
    |> Enum.map(&String.to_integer/1)
  end

  ## JS
  var plusOne = function(digits) {
    let sum = BigInt(digits.join('')) + 1n
    return sum.toString().split('')
};