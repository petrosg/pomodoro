defmodule PomodoroWeb.PomodoroLive do
  use Phoenix.LiveView

  alias PomodoroWeb.CustomComponents
  import Pomodoro.Timer

  @ten_seconds 10
  @ten_minutes 10 * 60

  @impl true
  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign_new(:timer, fn -> @ten_minutes end)
      |> assign_new(:remaining_time, fn -> @ten_seconds end)
      # |> assign_new(:remaining_time, fn -> @ten_minutes end)
      |> assign_new(:timer_opts, fn -> timer_opts() end)

    if connected?(socket), do: count_down_timer()
    {:ok, socket}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class={["h-lvh text-center",
        @remaining_time > 0 && "bg-green-400 w-screen",
        @remaining_time <= 0 && "bg-red-400 w-screen"
    ]}>
      <CustomComponents.header> Pomodoro Timer </CustomComponents.header>
      <CustomComponents.image src="/images/timer.png" alt=""/>
      <CustomComponents.timer_text remaining_time={@remaining_time} />
      <CustomComponents.timer_select />
    </div>
    """
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

  defp count_down_timer() do
    Process.send_after(self(), :tick, 1000)
  end

  defp update_timers(socket, timer) do
    socket
    |> update(:remaining_time, fn _ -> timer end)
  end

  defp update_timers(socket, _timer, remaining_time) do
    socket
    |> update(:remaining_time, fn _ -> remaining_time - 1 end)
  end
end
