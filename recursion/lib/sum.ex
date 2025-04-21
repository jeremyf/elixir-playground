defmodule Sum do
  def up_to(0), do: 0
  def up_to(n), do: n + up_to(n-1)

  # Using tail recursion with a default value, thus preserving the method
  # signature of the traditional recursion (e.g. `Sum.up_to/1`)
  def up_to_tr(n, acc \\ 0)
  def up_to_tr(0, acc), do: acc
  def up_to_tr(n, acc) when n > 0, do: up_to_tr(n-1, n+acc)
end
