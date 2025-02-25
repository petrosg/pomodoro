defmodule Pomodoro.Timer do
  @ten_seconds 10
  @ten_minutes 10 * 60
  @fifteen_minutes 15 * 60
  @twenty_five_minutes 25 * 60

  def timer_opts() do
    [
      {"10s", @ten_seconds},
      {"10m", @ten_minutes},
      {"15m", @fifteen_minutes},
      {"25m", @twenty_five_minutes}
    ]
  end

  def format_time(time) do
    time
    |> Timex.Duration.from_seconds()
    |> Timex.format_duration(:humanized)
  end
end
