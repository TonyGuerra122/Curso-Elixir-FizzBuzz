defmodule FizzBuzz do
  def build(filename) do
    filename
      |> File.read()
      |> handle_file_read()
  end

  def handle_file_read({:ok, result}), do: result
  def handle_file_read({:error, reason}), do: reason
end
