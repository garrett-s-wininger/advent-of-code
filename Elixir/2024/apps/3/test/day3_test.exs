defmodule Day3Test do
  use ExUnit.Case

  test "calculates good input correctly" do
    assert Day3.parse("mul(44,46)") == [{44, 46}]
    assert Day3.parse("mul(123,4)") == [{123, 4}]
  end

  test "parses multiple inputs correctly" do
    assert Day3.parse(
      "xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))"
    ) == [{2,4}, {5,5}, {11,8}, {8,5}]
  end

  test "skips improper inputs" do
    assert Day3.parse("mul(4*") == []
    assert Day3.parse("mul(6,9!") == []
    assert Day3.parse("?(12,34)") == []
    assert Day3.parse("mul ( 2 , 4 )") == []
  end

  test "properly handles conditionals" do
    assert Day3.parse(
      "xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))",
      conditonals: true
    ) == [{2,4}, {8,5}]
  end
end
