defmodule TimeManager.WorkingtimesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TimeManager.Workingtimes` context.
  """

  @doc """
  Generate a workingtime.
  """
  def workingtime_fixture(attrs \\ %{}) do
    {:ok, workingtime} =
      attrs
      |> Enum.into(%{
        end: ~N[2026-09-21 09:11:00],
        start: ~N[2026-09-21 09:11:00]
      })
      |> TimeManager.Workingtimes.create_workingtime()

    workingtime
  end
end
