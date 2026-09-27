defmodule TimeManagerWeb.ClockController do
  use TimeManagerWeb, :controller

  alias TimeManager.Clocks

  action_fallback TimeManagerWeb.FallbackController

  def index(conn, %{"userID" => user_id}) do

    clocks = Clocks.list_clocks_for_user(user_id)
    render(conn, :index, clocks: clocks)
  end

  def create(conn, %{"userID" => user_id}) do
    case Clocks.clock_in_or_out(user_id) do
      {:ok, clock} ->
        conn
        |> put_status(:created)
        |> render(:show, clock: clock)

      {:error, changeset} ->
        {:error, changeset}
    end
  end
end
