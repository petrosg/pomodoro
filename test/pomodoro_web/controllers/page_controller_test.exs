defmodule PomodoroWeb.PageControllerTest do
  use PomodoroWeb.ConnCase, async: true
  import Phoenix.LiveViewTest

  describe "PageLive" do
    test "renders the index page", %{conn: conn} do
      {:ok, _view, html} = live(conn, "/")
      assert html =~ "Pomodoro Timer"
    end

    test "starts a new pomodoro timer", %{conn: conn} do
      {:ok, view, _html} = live(conn, "/")

      assert render(view) =~
               "<h2 class=\"text-2xl md:text-2xl lg:text-2xl font-bold mb-20\">\n   Remaining Time: 10 seconds\n    \n  </h2>"
    end

    test "change timer starts a new pomodoro timer", %{conn: conn} do
      {:ok, view, _html} = live(conn, "/")

      assert render(view) =~
               "<h2 class=\"text-2xl md:text-2xl lg:text-2xl font-bold mb-20\">\n   Remaining Time: 10 seconds\n    \n  </h2>"

      assert view
             |> element("form")
             |> render_change(%{"timer" => 25 * 60}) =~
               "<h2 class=\"text-2xl md:text-2xl lg:text-2xl font-bold mb-20\">\n   Remaining Time: 25 minutes\n    \n  </h2>"
    end
  end
end
