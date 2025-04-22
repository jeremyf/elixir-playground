defmodule Factorial do
  def of(0), do: 1
  def of(n) when n > 0 do
    # We rely on the lazy evaluation of the list
    # 1..10_000_000
    Stream.iterate(1, &(&1+1))
    |> Enum.take(n)
    |> Enum.reduce(&(&1*&2))

    # The Stream module also has Stream.cycle/1 function, which takes a list and
    # for "forever" loops through that list.
  end
end
