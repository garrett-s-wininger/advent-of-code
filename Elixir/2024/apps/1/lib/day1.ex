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
end
