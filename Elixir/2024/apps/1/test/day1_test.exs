defmodule Day1Test do
  use ExUnit.Case

  test "calculates distance" do
    assert Day1.distance(1, 3) == 2
  end

  test "distance calculation is commmutative" do
    assert Day1.distance(3, 1) == Day1.distance(1, 3)
  end

  test "calculates distance between lists" do
    assert Day1.total_distance(
      {
         [3, 4, 2, 1, 3, 3],
         [4, 3, 5, 3, 9, 3]
      }
    ) == 11
  end
end
