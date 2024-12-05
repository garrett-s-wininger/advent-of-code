data = System.argv
|> hd
|> File.read!
|> String.split("\n")
|> Enum.map(fn data -> String.split(data, " ") end)
|> Enum.reverse
|> tl
|> Enum.reverse
|> Enum.map(
  fn values -> Enum.map(
    values,
    &String.to_integer/1)
  end)

IO.puts("===== PART 1 =====")
data
|> Enum.filter(&Day2.is_safe?/1)
|> Enum.count
|> IO.inspect

IO.puts("\n===== PART 2 =====")
data
|> Enum.filter(&Day2.can_make_safe?/1)
|> Enum.count
|> IO.inspect
