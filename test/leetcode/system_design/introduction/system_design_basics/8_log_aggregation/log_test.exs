defmodule Leetcode.SystemDesign.Introduction.SystemDesignBasics.LogAggregation.LogTest do
  use ExUnit.Case
  alias Leetcode.SystemDesign.Introduction.SystemDesignBasics.LogAggregation.Log

  test "greets the world O(n2)" do
    machines = [
      "LogAggregator",
      "pushLog",
      "pushLog",
      "pushLog",
      "pushLog",
      "pushLog",
      "pushLog",
      "pushLog",
      "pushLog",
      "pushLog",
      "pushLog",
      "pushLog",
      "pushLog",
      "getLogsFromMachine",
      "getLogsOfService",
      "search",
      "search"
    ]

    services = [
      [3, 3],
      [2322, 1, 1, "Machine 1 Service 1 Log 1"],
      [2312, 1, 1, "Machine 1 Service 1 Log 2"],
      [2352, 1, 1, "Machine 1 Service 1 Log 3"],
      [2298, 1, 1, "Machine 1 Service 1 Log 4"],
      [23221, 1, 2, "Machine 1 Service 2 Log 1"],
      [23121, 1, 2, "Machine 1 Service 2 Log 2"],
      [23222, 2, 2, "Machine 2 Service 2 Log 1"],
      [23122, 2, 2, "Machine 2 Service 2 Log 2"],
      [23521, 1, 2, "Machine 1 Service 2 Log 3"],
      [22981, 1, 2, "Machine 1 Service 2 Log 4"],
      [23522, 2, 2, "Machine 2 Service 2 Log 3"],
      [22982, 2, 2, "Machine 2 Service 2 Log 4"],
      [2],
      [2],
      [1, "Log 1"],
      [2, "Log 3"]
    ]

    assert Log.init_(machines, services) ==
             [
               nil,
               nil,
               nil,
               nil,
               nil,
               nil,
               nil,
               nil,
               nil,
               nil,
               nil,
               nil,
               nil,
               [23222, 23122, 23522, 22982],
               [23221, 23121, 23222, 23122, 23521, 22981, 23522, 22982],
               ["Machine 1 Service 1 Log 1"],
               ["Machine 1 Service 2 Log 3", "Machine 2 Service 2 Log 3"]
             ]
  end
end
