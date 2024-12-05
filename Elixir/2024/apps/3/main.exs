System.argv
|> hd
|> File.read!
|> Day3.parse
|> Enum.map(fn val -> (val |> elem(0)) * (val |> elem(1)) end)
|> Enum.sum
|> IO.inspect
