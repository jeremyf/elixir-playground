defmodule Fibonacci do
  def seqr(upto, acc \\ [])

  def seqr(0, _), do: [0]
  def seqr(1, _), do: [0,1]

  def seqr(upto, acc) when upto > 1 do
    value = value_at(upto)
    seqr(upto - 1, acc) ++ [value]
  end

  # I grabbed this from an online resource; unfold makes my brain hurt.
  #
  # `Enum.take/2` is an Enumerable (e.g. an array) in which you take upto a
  # certain number.
  #
  # The `Stream.unfold/2` is a "generator", that kicks off with 0.  Let's look
  # at: `0 -> {0, {0, 1}}`
  #
  # When the given sequence number matches 0, we push 0 into the accumulated
  # array.  Then pass {0,1} to the next call of the unfold.  We repeat this
  # `upto` number of times.
  #
  # And after the first time, we match the patter `{ix, iy}`; using that clause.
  # Pushing 1 into the accumulator, and passing {1,1} to the unfold.
  def seq(upto) do
    Stream.unfold(0, fn
      0 -> {0, {0, 1}}
      {ix, iy} -> {iy, {iy, ix + iy}}
    end) |> Enum.take(upto)
  end

  defp value_at(0), do: 0
  defp value_at(1), do: 1

  defp value_at(n) when n > 1 do
    value_at(n - 1) + value_at(n-2)
  end
end
