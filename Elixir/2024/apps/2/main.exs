System.argv
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
|> Enum.filter(&Day2.is_safe?/1)
|> Enum.count
|> IO.inspect(charlists: false)
