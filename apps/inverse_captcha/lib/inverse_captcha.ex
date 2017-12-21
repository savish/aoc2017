defmodule InverseCaptcha do
  @moduledoc """
  The inverse captcha module allows you to review a sequence of digits and find 
  the sum of all digits that match the digit halfway around the circular list.

  ## Sample:
  - 1212 produces 6: the list contains 4 items, and all four digits match the 
    digit 2 items ahead.
  - 1221 produces 0, because every comparison is between a 1 and a 2.
  - 123425 produces 4, because both 2s match each other, but no other digit has 
    a match.
  - 123123 produces 12.
  - 12131415 produces 4.

  """

  defp tuple_sum({d1, d2} = _digit_tuple) when d1 == d2 do
    d1
  end

  defp tuple_sum({d1, d2} = _digit_tuple) when d1 != d2 do
    0
  end

  @doc """
  Solve the captcha given a digit string

  ## Examples 

      iex> InverseCaptcha.solve("1212")
      6

  """
  def solve(input_string) do
    digits =
      input_string
      |> String.graphemes()
      |> Enum.map(&String.to_integer(&1))

    half_count = round(length(digits) / 2)
    split_digits = Enum.chunk(digits, half_count, half_count)

    Enum.zip([digits, List.flatten(tl(split_digits) ++ [hd(split_digits)])])
    |> Enum.reduce(0, fn tp, acc -> tuple_sum(tp) + acc end)
  end
end
