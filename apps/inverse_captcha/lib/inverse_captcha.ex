defmodule InverseCaptcha do
  @moduledoc """
  The inverse captcha module allows you to review a sequence of digits and find 
  the sum of all digits that match the next digit in the list. 

  The list is circular, so the digit after the last digit is the first digit 
  in the list.

  ## Sample:
  - 1122 produces a sum of 3 (1 + 2) because the first digit (1) matches the 
    second digit and the third digit (2) matches the fourth digit.
  - 1111 produces 4 because each digit (all 1) matches the next.
  - 1234 produces 0 because no digit matches the next.
  - 91212129 produces 9 because the only digit that matches the next one is the 
    last digit, 9.

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

      iex> InverseCaptcha.solve("112234556677")
      21

  """
  def solve(input_string) do
    digits =
      input_string
      |> String.graphemes()
      |> Enum.map(&String.to_integer(&1))

    Enum.zip([digits, tl(digits) ++ [hd(digits)]])
    |> Enum.reduce(0, fn tp, acc -> tuple_sum(tp) + acc end)
  end
end
