defmodule Leetcode.SystemDesign.Introduction.SystemDesignBasics.LogAggregation.Log do
  def init_(information, infomation_2) do
    information
    |> Enum.zip(infomation_2)
    |> Enum.reduce(%{}, fn {event, params}, acc ->
      cond do
        "LogAggregator" == event ->
          create_machines(params)

        true ->
          acc
      end
    end)
  end

  defp create_machines([machines, services]) do
    Enum.reduce(1..machines, %{}, fn machine_id, acc ->
      Map.put(acc, machine_id, create_services(services))
    end)
  end

  defp create_services(services) do
    Enum.reduce(1..services, %{}, fn service_id, acc ->
      Map.put(acc, service_id, [])
    end)
  end

  def push_log(log_id, machine_id, service_id, message) do
  end

  def get_logs_from_machine(machine_id) do
  end

  def get_logs_of_service(service_id) do
  end

  def search(service_id, search_string) do
  end
end
