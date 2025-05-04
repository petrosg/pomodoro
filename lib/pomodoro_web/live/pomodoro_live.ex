defmodule PomodoroWeb.PomodoroLive do
  use Phoenix.LiveView

  alias PomodoroWeb.CustomComponents
  import Pomodoro.Timer

  # @ten_seconds 10
  # @ten_minutes 10 * 60

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(_params, _uri, socket) do
    socket =
      socket
      |> assign(timer: nil)
      |> assign(timer_opts: timer_opts())
      |> assign(remaining_time: nil)

    {:noreply, socket}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class={["h-lvh text-center",
        @remaining_time === nil && "bg-yellow-400 w-screen",
        @remaining_time > 0 && "bg-red-400 w-screen",
        @remaining_time === 0 && "bg-green-400 w-screen"
    ]}>
      <CustomComponents.header> Pomodoro Timer </CustomComponents.header>
      <CustomComponents.image src="/images/timer.png" alt=""/>
      <CustomComponents.timer_text remaining_time={@remaining_time} />
      <CustomComponents.timer_select />
    </div>
    """
  end

  @impl true
  def handle_info(:tick, %{assigns: %{remaining_time: 0}} = socket) do
    socket = assign(socket, :time_ref, nil)
    {:noreply, socket}
  end

  @impl true
  def handle_info(:tick, %{assigns: %{timer: timer, remaining_time: remaining_time}} = socket) do
    # time_ref used for canceling
    time_ref = count_down_timer()
    socket = assign(socket, :time_ref, time_ref)

    {:noreply,
     socket
     |> update_timers(timer, remaining_time)}
  end

  @impl true
  def handle_event(
        "set-timer",
        %{"timer" => timer} = _params,
        %{assigns: %{time_ref: time_ref}} = socket
      )
      when time_ref !== nil do
    IO.inspect(self(), label: "CANCEL TIMER")
    Process.cancel_timer(time_ref)

    timer = String.to_integer(timer)

    time_ref = count_down_timer()
    socket = assign(socket, :time_ref, time_ref)

    {:noreply, update_timers(socket, timer)}
  end

  @impl true
  def handle_event("set-timer", %{"timer" => timer} = _params, socket) do
    timer = String.to_integer(timer)

    time_ref = count_down_timer()
    socket = assign(socket, :time_ref, time_ref)

    {:noreply, update_timers(socket, timer)}
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
