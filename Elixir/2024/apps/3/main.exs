data = System.argv
|> hd
|> File.read!

IO.puts("===== PART 1 =====")
data
|> Day3.parse
|> Enum.map(fn val -> (val |> elem(0)) * (val |> elem(1)) end)
|> Enum.sum
|> IO.inspect

IO.puts("\n===== PART 2 =====")
data
|> Day3.parse(conditonals: true)
|> Enum.map(fn val -> (val |> elem(0)) * (val |> elem(1)) end)
|> Enum.sum
|> IO.inspect
