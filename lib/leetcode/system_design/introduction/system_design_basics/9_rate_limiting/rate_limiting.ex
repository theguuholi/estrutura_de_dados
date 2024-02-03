defmodule Leetcode.SystemDesign.Introduction.SystemDesignBasics.RateLimiting do
  defstruct limit: nil, time_window: nil, allowed_requests: [], last_response: nil

  def init_(limit, time_window) do
    %__MODULE__{limit: limit, time_window: time_window}
  end

  def should_allow(rate_limiting, timestamp) do
    min_allowed_time = timestamp - rate_limiting.time_window + 1

    new_allowed_requests_list =
      remove_old_requests(rate_limiting.allowed_requests, min_allowed_time)

    rate_limiting = %__MODULE__{rate_limiting | allowed_requests: new_allowed_requests_list}

    if rate_limiting.allowed_requests |> length() < rate_limiting.limit do
      rate_limiting = Map.update!(rate_limiting, :allowed_requests, &(&1 ++ [timestamp]))

      %__MODULE__{rate_limiting | last_response: true}
    else
      %__MODULE__{rate_limiting | last_response: false}
    end
  end

  def remove_old_requests(allowed_requests, min_allowed_time) do
    case allowed_requests do
      [first | rest] when first < min_allowed_time ->
        remove_old_requests(rest, min_allowed_time)

      _ ->
        allowed_requests
    end
  end
end
