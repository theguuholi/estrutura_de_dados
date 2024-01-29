defmodule Leetcode.SystemDesign.Introduction.SystemDesignBasics.LogAggregation.Log do
  def init_(information, infomation_2) do
    {r, m} =
      a =
      information
      |> Enum.zip(infomation_2)
      |> Enum.reduce({[], %{}}, fn {event, params}, {logs, machines} = acc ->
        cond do
          "LogAggregator" == event ->
            machines = create_machines(params)
            logs = logs ++ [nil]
            {logs, machines}

          "pushLog" == event ->
            [log_id, machine_id, service_id, message] = params

            service_logs = machines[machine_id][service_id]

            machines =
              Map.put(
                machines,
                machine_id,
                Map.put(machines[machine_id], service_id, service_logs ++ [{log_id, message}])
              )

            logs = logs ++ [nil]
            {logs, machines}

          "getLogsFromMachine" == event ->
            IO.inspect(params, label: "pump")

            r =
              Enum.map(params, fn machine ->
                machine = Map.get(machines, machine)
                services = Map.to_list(machine)

                Enum.reduce(services, [], fn {_service_id, logs}, acc ->
                  acc ++ Enum.map(logs, fn {log_id, _m} -> log_id end)
                end)
                |> List.flatten()
              end)

            logs = logs ++ r
            {logs, machines}

          "getLogsOfService" == event ->
            acc

          true ->
            acc
        end
      end)

    r
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
