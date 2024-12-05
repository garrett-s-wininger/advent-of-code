defmodule Day2Test do
  use ExUnit.Case

  test "calculates differences correctly" do
    assert Day2.calculate_differences(
      [7, 6, 4, 2, 1]
    ) == [-1, -2, -2, -1]

    assert Day2.calculate_differences(
      [1, 2, 7, 8, 9]
    ) == [1, 5, 1, 1]

    assert Day2.calculate_differences(
      [9, 7, 6, 2, 1]
    ) == [-2, -1, -4, -1]

    assert Day2.calculate_differences(
      [1, 3, 2, 4, 5]
    ) == [2, -1, 2, 1]

    assert Day2.calculate_differences(
      [8, 6, 4, 4, 1]
    ) == [-2, -2, 0, -3]

    assert Day2.calculate_differences(
      [1, 3, 6, 7, 9]
    ) == [2, 3, 1, 2]
  end

  test "determines ability to dampen failure correctly" do
    assert Day2.can_make_safe?([7, 6, 4, 2, 1]) == true
    assert Day2.can_make_safe?([1, 3, 2, 4, 5]) == true
    assert Day2.can_make_safe?([8, 6, 4, 4, 1]) == true
    assert Day2.can_make_safe?([1, 3, 6, 7, 9]) == true

    assert Day2.can_make_safe?([1, 2, 7, 8, 9]) == false
    assert Day2.can_make_safe?([9, 7, 6, 2, 1]) == false
  end

  test "determines safe levels correctly" do
    assert Day2.is_safe?([7, 6, 4, 2, 1]) == true
    assert Day2.is_safe?([1, 3, 6, 7, 9]) == true

    assert Day2.is_safe?([1, 2, 7, 8, 9]) == false
    assert Day2.is_safe?([9, 7, 6, 2, 1]) == false
    assert Day2.is_safe?([1, 3, 2, 4, 5]) == false
    assert Day2.is_safe?([8, 6, 4, 4, 1]) == false
  end
end
