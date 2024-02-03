defmodule Leetcode.SystemDesign.Introduction.SystemDesignBasics.RateLimitingTest do
  use ExUnit.Case
  alias Leetcode.SystemDesign.Introduction.SystemDesignBasics.RateLimiting

  test "init" do
    assert RateLimiting.init_(3, 5) == %RateLimiting{limit: 3, time_window: 5}
  end

  test "should_allow 1" do
    assert RateLimiting.init_(3, 5)
           |> RateLimiting.should_allow(1) == %RateLimiting{
             limit: 3,
             time_window: 5,
             allowed_requests: [1],
             last_response: true
           }
  end

  test "should_allow 2" do
    assert RateLimiting.init_(3, 5)
           |> RateLimiting.should_allow(1)
           |> RateLimiting.should_allow(1) ==
             %RateLimiting{
               limit: 3,
               time_window: 5,
               allowed_requests: [1, 1],
               last_response: true
             }
  end

  test "should_allow 3" do
    assert RateLimiting.init_(3, 5)
           |> RateLimiting.should_allow(1)
           |> RateLimiting.should_allow(1)
           |> RateLimiting.should_allow(2) ==
             %RateLimiting{
               limit: 3,
               time_window: 5,
               allowed_requests: [1, 1, 2],
               last_response: true
             }
  end

  test "should_allow 4" do
    assert RateLimiting.init_(3, 5)
           |> RateLimiting.should_allow(1)
           |> RateLimiting.should_allow(1)
           |> RateLimiting.should_allow(2)
           |> RateLimiting.should_allow(3) ==
             %RateLimiting{
               limit: 3,
               time_window: 5,
               allowed_requests: [1, 1, 2],
               last_response: false
             }
  end

  test "should_allow 5" do
    assert RateLimiting.init_(3, 5)
           |> RateLimiting.should_allow(1)
           |> RateLimiting.should_allow(1)
           |> RateLimiting.should_allow(2)
           |> RateLimiting.should_allow(3)
           |> RateLimiting.should_allow(8) ==
             %RateLimiting{
               limit: 3,
               time_window: 5,
               allowed_requests: [8],
               last_response: true
             }
  end
end
