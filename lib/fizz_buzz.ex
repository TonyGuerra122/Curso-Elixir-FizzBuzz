defmodule FizzBuzz do
  def build(filename) do
    filename
    |> File.read()
    |> handle_file_read()
  end

  defp handle_file_read({:ok, result}) do
    # "1, 2, 3, 4" -> [1, 2, 3, 4]
    result =
      result
      |> String.split(",")
      |> Enum.map(fn numbers -> String.trim(numbers) |> convert_and_evaluate_numbers() end)

      {:ok, result}
  end

  defp handle_file_read({:error, reason}), do: {:error, "Error reading the file: #{reason}"}

  defp convert_and_evaluate_numbers(element) do
    element
    |> String.to_integer()
    |> evaluate_numbers()
  end

  # Pattern Matches
  defp evaluate_numbers(number) when rem(number, 3) == 0 and rem(number, 5) == 0, do: :fizzbuzz
  defp evaluate_numbers(number) when rem(number, 3) == 0, do: :fizz
  defp evaluate_numbers(number) when rem(number, 5) == 0, do: :buzz
  defp evaluate_numbers(number), do: number
end
