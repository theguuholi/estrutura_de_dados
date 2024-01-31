defmodule LogAggregatorTest do
  use ExUnit.Case

  test "push_log updates logs for machines, logs for services, and logs" do
    log_agg =
      %LogAggregator{}
      |> LogAggregator.push_log(1, 101, 201, "Message 1")
      |> LogAggregator.push_log(2, 101, 202, "Message 2")
      |> LogAggregator.push_log(3, 102, 201, "Message 3")

    assert Map.get(log_agg.logs_for_machines, 101) == [1, 2]
    assert Map.get(log_agg.logs_for_machines, 102) == [3]
    assert Map.get(log_agg.logs_for_services, 201) == [1, 3]
    assert Map.get(log_agg.logs_for_services, 202) == [2]
    assert Map.get(log_agg.logs, 1) == "Message 1"
    assert Map.get(log_agg.logs, 2) == "Message 2"
    assert Map.get(log_agg.logs, 3) == "Message 3"
  end

  test "get_logs_from_machine returns logs for a specific machine" do
    log_agg =
      %LogAggregator{}
      |> LogAggregator.push_log(1, 101, 201, "Message 1")
      |> LogAggregator.push_log(2, 101, 202, "Message 2")
      |> LogAggregator.push_log(3, 102, 201, "Message 3")

    assert LogAggregator.get_logs_from_machine(log_agg, 101) == [1, 2]
    assert LogAggregator.get_logs_from_machine(log_agg, 102) == [3]
    assert LogAggregator.get_logs_from_machine(log_agg, 103) == []
  end

  test "get_logs_of_service returns logs for a specific service" do
    log_agg =
      %LogAggregator{}
      |> LogAggregator.push_log(1, 101, 201, "Message 1")
      |> LogAggregator.push_log(2, 101, 202, "Message 2")
      |> LogAggregator.push_log(3, 102, 201, "Message 3")

    assert LogAggregator.get_logs_of_service(log_agg, 201) == [1, 3]
    assert LogAggregator.get_logs_of_service(log_agg, 202) == [2]
    assert LogAggregator.get_logs_of_service(log_agg, 203) == []
  end

  test "search returns logs containing a specific string for a service" do
    log_agg =
      %LogAggregator{}
      |> LogAggregator.push_log(1, 101, 201, "Message 1")
      |> LogAggregator.push_log(2, 101, 202, "Message 2")
      |> LogAggregator.push_log(3, 102, 201, "Message 3")

    assert LogAggregator.search(log_agg, 201, "Message") == ["Message 1", "Message 3"]
    assert LogAggregator.search(log_agg, 202, "Message") == ["Message 2"]
    assert LogAggregator.search(log_agg, 203, "Message") == []
  end
end
