defmodule PomodoroWeb.CustomComponents do
  use PomodoroWeb, :html

  alias Pomodoro.Timer

  slot :inner_block, required: true

  def header(assigns) do
    ~H"""
     <section class="flex justify-center mr-0">
      <h1 class="text-4xl md:text-6xl lg:text-8xl font-bold">
       {render_slot(@inner_block)}
      </h1>
     </section>
    """
  end

  def timer_select(assigns) do
    ~H"""
     <div>
       <form phx-change="set-timer">
         <select name="timer" class="border-2 border-gray-300 bg-red-600 text-white m-1 p-3" id="">
            <option value="" disabled selected>Select Timer</option>
            <option :for={ {text, value} <- Timer.timer_opts()} value={value}> { text } </option>
         </select>
       </form>
     </div>
    """
  end
end
