defmodule Day3 do
  def parse(input) when is_binary(input) do
    parse(input, 0, fn val -> val == "m" end, %{num_start: nil, lhs: nil}, [])
  end

  defp parse(input, index, expected, state, acc) when is_binary(input) do
    cond do
      index == String.length(input) -> Enum.reverse(acc)
      expected.(String.at(input, index)) -> case String.at(input, index) do
        "m" -> parse(
          input,
          index + 1,
          fn val -> val == "u" end,
          state,
          acc
        )
        "u" -> parse(
          input,
          index + 1,
          fn val -> val == "l" end,
          state,
          acc
        )
        "l" -> parse(
          input,
          index + 1,
          fn val -> val == "(" end,
          state,
          acc
        )
        "(" -> parse(
          input,
          index + 1,
          fn val -> val >= "0" and val <= "9" end,
          Map.put(state, :num_start, index + 1),
          acc
        )
        "," -> parse(
          input,
          index + 1,
          fn val -> val >= "0" and val <= "9" end,
          %{
            num_start: index + 1,
            lhs: String.to_integer(
              String.slice(
                input,
                Map.fetch!(state, :num_start),
                index - Map.fetch!(state, :num_start)
              )
            )
          },
          acc
        )
        ")" -> parse(
          input,
          index + 1,
          fn val -> val == "m" end,
          %{num_start: nil, lhs: nil},
          List.insert_at(
            acc,
            0,
            {
              Map.fetch!(state, :lhs),
              String.to_integer(
                String.slice(
                  input,
                  Map.fetch!(state, :num_start),
                  index - Map.fetch!(state, :num_start)
                )
              )
            }
          )
        )
        char when char in ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"] -> 
          case state do
            %{lhs: nil} -> parse(
              input,
              index + 1,
              fn val -> val == "," or (val >= "0" and val <= "9") end,
              state,
              acc
            )
            _ -> parse(
              input,
              index + 1,
              fn val -> val == ")" or (val >= "0" and val <= "9") end,
              state,
              acc
            )
          end
      end
      true -> parse(
        input,
        index + 1,
        fn val -> val == "m" end,
        %{num_start: nil, lhs: nil},
        acc
      )
    end
  end
end
