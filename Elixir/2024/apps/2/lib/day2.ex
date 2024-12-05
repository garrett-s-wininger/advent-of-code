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

  def splice_out_indicies([]), do: []
  def splice_out_indicies([_head]), do: []

  def splice_out_indicies(values) when is_list(values) do
    splice_out_indicies(values, 0, Enum.count(values), [])
  end

  defp splice_out_indicies(values, index, max, acc) when is_list(values) do
    if index == max do
      acc
    else
      splice_out_indicies(
        values,
        index + 1,
        max,
        List.insert_at(acc, 0, List.pop_at(values, index) |> elem(1))
      )
    end
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

  def can_make_safe?([]), do: false
  def can_make_safe?([_head]), do: false

  def can_make_safe?(values) when is_list(values) do
    if is_safe?(values) do
      true
    else
      Enum.any?(splice_out_indicies(values), &is_safe?/1)
    end
  end
end
