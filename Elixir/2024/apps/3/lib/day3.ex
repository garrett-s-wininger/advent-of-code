defmodule Day3 do
  def parse(input, conditionals \\ false) when is_binary(input) do
    parse(
      input,
      0,
      fn val -> val == "m" or val == "d" end,
      %{
        conditionals: conditionals,
        mul_enabled: true
      },
      []
    )
  end

  defp parse(input, index, expected, state, acc) when is_binary(input) do
    cond do
      index == String.length(input) -> Enum.reverse(acc)
      expected.(String.at(input, index)) -> case String.at(input, index) do
        "m" ->
          if Map.fetch!(state, :mul_enabled) do
            result = parse_mul(
              input,
              index + 1,
              fn val -> val == "u" end,
              %{num_start: nil, lhs: nil}
            )

            case result do
              {:ok, new_index, operands} ->
                parse(
                  input,
                  new_index,
                  expected,
                  state,
                  List.insert_at(acc, 0, operands)
                )
              {:error, new_index} ->
                parse(
                  input,
                  new_index,
                  expected,
                  state,
                  acc
                )
            end
          else
            parse(
              input,
              index + 1,
              expected,
              state,
              acc
            )
          end
        "d" ->
          if Map.fetch!(state, :conditionals) do
            result = parse_conditional(
              input,
              index + 1,
              fn val -> val == "o" end,
              state
            )

            case result do
              {:ok, new_index, new_state} ->
                parse(
                  input,
                  new_index,
                  expected,
                  new_state,
                  acc
                )
              {:error, new_index} ->
                parse(
                  input,
                  new_index,
                  expected,
                  state,
                  acc
                )
            end
          else
            parse(
              input,
              index + 1,
              expected,
              state,
              acc
            )
          end
      end
      true -> parse(input, index + 1, expected, state, acc)
    end
  end

  defp parse_conditional(input, index, expected, state) when is_binary(input) do
    cond do
      index == String.length(input) -> {:error, index}
      expected.(String.at(input, index)) -> case String.at(input, index) do
        "o" -> if Map.fetch!(state, :mul_enabled) do
          parse_conditional(
            input,
            index + 1,
            fn val -> val == "n" end,
            state
          )
        else
          parse_conditional(
            input,
            index + 1,
            fn val -> val == "(" end,
            state
          )
        end
        "n" -> parse_conditional(
          input,
          index + 1,
          fn val -> val == "'" end,
          state
        )
        "'" -> parse_conditional(
          input,
          index + 1,
          fn val -> val == "t" end,
          state
        )
        "t" -> parse_conditional(
          input,
          index + 1,
          fn val -> val == "(" end,
          state
        )
        "(" -> parse_conditional(
          input,
          index + 1,
          fn val -> val == ")" end,
          state
        )
        ")" -> {
          :ok,
          index + 1,
          Map.put(state, :mul_enabled, !Map.fetch!(state, :mul_enabled))
        }
      end
      true -> {:error, index}
    end
  end

  defp parse_mul(input, index, expected, state) when is_binary(input) do
    cond do
      index == String.length(input) -> {:error, index}
      expected.(String.at(input, index)) -> case String.at(input, index) do
        "u" -> parse_mul(
          input,
          index + 1,
          fn val -> val == "l" end,
          state
        )
        "l" -> parse_mul(
          input,
          index + 1,
          fn val -> val == "(" end,
          state
        )
        "(" -> parse_mul(
          input,
          index + 1,
          fn val -> val >= "0" and val <= "9" end,
          Map.put(state, :num_start, index + 1)
        )
        "," -> parse_mul(
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
          }
        )
        ")" -> {
            :ok,
            index + 1,
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
          }
        char when char in ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"] -> 
          case state do
            %{lhs: nil} -> parse_mul(
              input,
              index + 1,
              fn val -> val == "," or (val >= "0" and val <= "9") end,
              state
            )
            _ -> parse_mul(
              input,
              index + 1,
              fn val -> val == ")" or (val >= "0" and val <= "9") end,
              state
            )
          end
        end
      true -> {:error, index}
    end
  end
end
