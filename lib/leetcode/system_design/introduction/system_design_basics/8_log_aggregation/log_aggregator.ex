defmodule LogAggregator do
  defstruct logs_for_machines: %{}, logs_for_services: %{}, logs: %{}

  def new, do: %__MODULE__{}

  def push_log(
        %__MODULE__{logs_for_machines: logs_m, logs_for_services: logs_s, logs: logs} = log_agg,
        log_id,
        machine_id,
        service_id,
        message
      ) do
    log_agg
    |> update_logs_for_machine(machine_id, log_id)
    |> update_logs_for_service(service_id, log_id)
    |> Map.put(:logs, Map.put(logs, log_id, message))
  end

  def get_logs_from_machine(%__MODULE__{logs_for_machines: logs_m}, machine_id) do
    Map.get(logs_m, machine_id, [])
  end

  def get_logs_of_service(%__MODULE__{logs_for_services: logs_s}, service_id) do
    Map.get(logs_s, service_id, [])
  end

  def search(%__MODULE__{logs_for_services: logs_s, logs: logs}, service_id, string_search) do
    logs_s
    |> Map.get(service_id, [])
    |> Enum.reduce([], fn log_id, acc ->
      log = Map.get(logs, log_id, "")

      if String.contains?(log, string_search) do
        [log | acc]
      else
        acc
      end
    end)
  end

  defp update_logs_for_machine(
         %__MODULE__{logs_for_machines: logs_m} = log_agg,
         machine_id,
         log_id
       ) do
    logs_m
    |> Map.update(machine_id, [log_id], &(&1 ++ [log_id]))
    |> Map.put(log_agg, :logs_for_machines)
  end

  defp update_logs_for_service(
         %__MODULE__{logs_for_services: logs_s} = log_agg,
         service_id,
         log_id
       ) do
    logs_s
    |> Map.update(service_id, [log_id], &(&1 ++ [log_id]))
    |> Map.put(log_agg, :logs_for_services)
  end
end
