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
      assert render(view) =~ "<span> Remaining Time: </span> 10 minutes"
    end

    test "change timer starts a new pomodoro timer", %{conn: conn} do
      {:ok, view, _html} = live(conn, "/")
      assert render(view) =~ "<span> Remaining Time: </span> 10 minutes"

      assert view |> element("form")
          |> render_change(%{"timer" => 25 * 60 }) =~ "<span> Remaining Time: </span> 25 minutes"
    end
  end
end
