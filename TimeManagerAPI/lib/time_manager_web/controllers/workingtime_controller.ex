defmodule TimeManagerWeb.WorkingtimeController do
  use TimeManagerWeb, :controller

  alias TimeManager.Workingtimes
  alias TimeManager.Workingtimes.Workingtime

  action_fallback TimeManagerWeb.FallbackController

  def index(conn, _params) do
    workingtimes = Workingtimes.list_workingtimes()
    render(conn, :index, workingtimes: workingtimes)
  end

  def create(conn, %{"userID" => user_id, "workingtime" => workingtime_params}) do
    workingtime_params =
      Map.put(workingtime_params, "user_id", user_id)

    with {:ok, %Workingtime{} = workingtime} <-
           Workingtimes.create_workingtime(workingtime_params) do
      conn
      |> put_status(:created)
      |> render(:show, workingtime: workingtime)
    end
  end

  def show(conn, %{"id" => id}) do
    workingtime = Workingtimes.get_workingtime!(id)
    render(conn, :show, workingtime: workingtime)
  end

  def show(conn, %{"userID" => user_id} = params) do
    start_date = Map.get(params, "start")
    end_date = Map.get(params, "end")

    case {start_date, end_date} do
      {nil, nil} ->
        # maybe return all workingtimes for user_id
        workingtimes = Workingtimes.list_workingtimes_for_user(user_id)
        render(conn, :index, workingtimes: workingtimes)

      _ ->
        # range query
        workingtimes = Workingtimes.list_workingtimes_for_user_in_range(user_id, start_date, end_date)
        render(conn, :index, workingtimes: workingtimes)
    end
  end

  def update(conn, %{"id" => id, "workingtime" => workingtime_params}) do
    workingtime = Workingtimes.get_workingtime!(id)

    with {:ok, %Workingtime{} = workingtime} <- Workingtimes.update_workingtime(workingtime, workingtime_params) do
      render(conn, :show, workingtime: workingtime)
    end
  end

  def delete(conn, %{"id" => id}) do
    workingtime = Workingtimes.get_workingtime!(id)

    with {:ok, %Workingtime{}} <- Workingtimes.delete_workingtime(workingtime) do
      send_resp(conn, :no_content, "")
    end
  end
end
