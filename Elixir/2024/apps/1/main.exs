processed_data = System.argv
|> hd
|> File.read
|> elem(1)
|> String.split("\n")
|> Enum.filter(fn x -> String.length(x) > 0 end)
|> Enum.map(fn x -> String.split(x, "   ") end)
|> Enum.map(
  fn [x, y] -> [elem(Integer.parse(x), 0), elem(Integer.parse(y), 0)] end)
|> Enum.reduce(
  {[], []},
  fn [x, y], {left, right} -> 
    {List.insert_at(left, 0, x), List.insert_at(right, 0, y)}
  end)

IO.puts("===== PART 1 =====")
IO.inspect(Day1.total_distance(processed_data))

IO.puts("\n===== PART 2 =====")
IO.inspect(Day1.similarity_score(processed_data))
