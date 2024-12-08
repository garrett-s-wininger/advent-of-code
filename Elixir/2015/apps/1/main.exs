#!/usr/bin/env elixir

System.argv()
|> hd
|> File.read!
|> String.graphemes() 
|> Enum.reduce(0, fn char, acc ->
    case char do
      "(" -> acc + 1
      ")" -> acc - 1
      _ -> acc
    end
  end)
|> IO.inspect
