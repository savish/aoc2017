defmodule CorruptionChecksum do
  @moduledoc """
  Documentation for CorruptionChecksum.
  """

  @doc """
  Determines the checksum of a given matrix 

  ## Example

      iex> CorruptionChecksum.solve("23    4    5\\n1    2    3\\n5    6    5")
      22
  """
  def solve(input_string) do
    input_string
    |> String.split("\n")
    |> Enum.map(&(&1 |> String.split("    ")))
    |> Enum.map(fn row -> Enum.map(row, &(&1 |> String.to_integer())) end)
    |> Enum.reduce(0, fn row, acc -> acc + Enum.max(row) - Enum.min(row) end)
  end
end
