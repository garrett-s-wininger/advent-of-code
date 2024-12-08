defmodule Day1 do
  def distance(x, y) do
    abs(x - y)
  end

  def total_distance({left, right}) do
    Enum.zip_reduce(
      Enum.sort(left),
      Enum.sort(right),
      0,
      fn x, y, acc -> distance(x, y) + acc end
    )
  end

  def occurrances(numbers) do
    Enum.reduce(
      numbers,
      %{},
      fn number, acc ->
        if !Map.has_key?(acc, number) do
          Map.merge(acc, %{number => 1})
        else
          elem(Map.get_and_update(acc, number, fn val -> {val, val + 1} end), 1)
        end
      end
    )
  end

  def similarity_score({left, right}) do
    occurrance_map = occurrances(right)

    Enum.reduce(
      left,
      0,
      fn number, acc ->
        if Map.has_key?(occurrance_map, number) do
          acc + number * Map.fetch!(occurrance_map, number)
        else
          acc
        end
      end
    )
  end
end
