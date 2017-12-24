defmodule CorruptionChecksum do
  @moduledoc """
  Documentation for CorruptionChecksum.
  """

  @doc """
  Determines the checksum of a given matrix 

  ## Example

      iex> CorruptionChecksum.solve("5    9    2    8\\n9    4    7    3")
      7
  """
  def solve(input_string) do
    input_string
    |> String.split("\n")
    |> Enum.map(&(&1 |> String.split("    ")))
    |> Enum.map(fn row -> Enum.map(row, &(&1 |> String.to_integer())) end)
    |> Enum.reduce(0, fn row, acc ->
      acc +
        hd(
          for d1 <- row,
              d2 <- row,
              rem(d1, d2) == 0 and d1 != d2,
              do: div(d1, d2)
        )
    end)
  end
end
