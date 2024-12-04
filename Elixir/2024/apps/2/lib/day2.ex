defmodule Day2 do
  def calculate_differences([]), do: []
  def calculate_differences([_head]), do: []

  def calculate_differences([head | tail]) do
    calculate_differences(head, tail, [])
  end

  defp calculate_differences(lhs, [head], acc) do
    List.insert_at(acc, Enum.count(acc), -1 * (lhs - head))
  end

  defp calculate_differences(lhs, [head | tail], acc) do
    calculate_differences(
      head, tail, List.insert_at(acc, Enum.count(acc), -1 * (lhs - head))
    )
  end

  def is_safe?([]), do: false
  def is_safe?([_head]), do: false

  def is_safe?(values) when is_list(values) do
    differences = calculate_differences(values)
    all_increasing = Enum.all?(differences, fn val -> val > 0 end)
    all_decreasing = Enum.all?(differences, fn val -> val < 0 end)

    cond do
      !all_increasing and !all_decreasing -> false
      Enum.any?(differences, fn val -> abs(val) > 3 end) -> false
      Enum.any?(differences, fn val -> abs(val) < 1 end) -> false
      true -> true
    end
  end
end
