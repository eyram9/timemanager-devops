defmodule TimeManager.Clocks do
  @moduledoc """
  The Clocks context.
  """

  import Ecto.Query, warn: false
  alias TimeManager.Repo
  alias TimeManager.Clocks.Clock

  def list_clocks_for_user(user_id) do
    query =
      from c in Clock,
        where: c.user_id == ^user_id,
        order_by: [asc: c.time]

    Repo.all(query)
  end

  def get_last_clock(user_id) do
    query =
      from c in Clock,
        where: c.user_id == ^user_id,
        order_by: [desc: c.time],
        limit: 1

    Repo.one(query)
  end

  def create_clock(attrs) do
    %Clock{}
    |> Clock.changeset(attrs)
    |> Repo.insert()
  end

  def clock_in_or_out(user_id) do
    last_clock = get_last_clock(user_id)

    status =
      case last_clock do
        nil -> true
        %{status: true} -> false
        %{status: false} -> true
      end

    create_clock(%{
      time: DateTime.utc_now(),
      status: status,
      user_id: user_id
    })
  end
end
