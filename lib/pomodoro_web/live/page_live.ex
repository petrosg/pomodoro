defmodule PomodoroWeb.PageLive do
  use PomodoroWeb, :live_view

  @ten_seconds 10
  @ten_minutes 600
  @twenty_five_minutes 1500

  @impl true
  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign_new(:timer, fn -> @ten_minutes end)
      |> assign_new(:remaining_time, fn -> @ten_minutes end)

    if connected?(socket), do: count_down_timer()
    {:ok, socket}
  end

  @impl true
  def handle_info(:tick, socket) do
    count_down_timer()
    %{timer: timer, remaining_time: remaining_time} = socket.assigns

    {:noreply,
     socket
     |> update_timers(timer, remaining_time)}
  end

  @impl true
  def handle_event("set-timer", %{"timer" => timer} = _params, socket) do
    timer = timer |> String.to_integer()

    {:noreply,
     socket
     |> update_timers(timer)}
  end

  defp timer_opts do
    [{"10s", @ten_seconds}, {"10m", @ten_minutes}, {"25m", @twenty_five_minutes}]
  end

  defp format_time(time) do
    time
    |> Timex.Duration.from_seconds()
    |> Timex.format_duration(:humanized)
  end

  defp count_down_timer() do
    Process.send_after(self(), :tick, 1000)
  end

  defp update_timers(socket, timer) do
    socket
    |> update(:timer, fn _ -> timer end)
    |> update(:remaining_time, fn _ -> timer end)
  end

  defp update_timers(socket, timer, remaining_time) do
    socket
    |> update(:timer, fn _ -> timer end)
    |> update(:remaining_time, fn _ -> remaining_time - 1 end)
  end
end
