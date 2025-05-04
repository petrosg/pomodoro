defmodule PomodoroWeb.CustomComponents do
  use PomodoroWeb, :html

  alias Pomodoro.Timer

  slot :inner_block, required: true

  def header(assigns) do
    ~H"""
     <section class="mr-0">
      <h1 class="text-4xl md:text-6xl lg:text-8xl font-bold">
       {render_slot(@inner_block)}
      </h1>
     </section>
    """
  end

  attr :src, :string, required: true
  attr :alt, :string, default: ""

  def image(assigns) do
    ~H"""
    <section class="flex justify-center mt-20 mb-20">
      <img class="object-scale-down h-52" src={@src} alt={@alt} />
    </section>
    """
  end

  attr :remaining_time, :atom, required: true

  def timer_text(assigns) do
    ~H"""
    <section>
      <h2  class="text-2xl md:text-2xl lg:text-2xl font-bold mb-20" >
      <%= cond do %>
        <% @remaining_time === nil -> %> Please select from dropdown menu
        <% @remaining_time > 0 -> %> Remaining Time: {Timer.format_time(@remaining_time)}
        <% @remaining_time === 0 -> %> Expired!
        <% true -> %> Check it!
      <% end %>
      </h2>
    </section>
    """
  end

  def timer_select(assigns) do
    ~H"""
     <section>
        <form phx-change="set-timer">
          <select name="timer" class="border-2 border-gray-300 bg-red-600 text-white m-1 p-3" id="">
              <option value="" disabled selected>Select Timer</option>
              <option :for={ {text, value} <- Timer.timer_opts()} value={value}>
                { text }
              </option>
          </select>
        </form>
    </section>
    """
  end
end
