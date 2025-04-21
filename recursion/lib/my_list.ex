defmodule MyList do
  def max([]), do: nil
  def max([el]), do: el
  def max([left, right]) when left >= right, do: left
  def max([left, right]) when left < right, do: right

  def max([left, right | tail]) when left >= right do
    max([left | tail])
  end

  def max([left, right | tail]) when left < right do
    max([right| tail])
  end

  def min([]), do: nil
  def min([el]), do: el
  def min([left, right]) when left >= right, do: right
  def min([left, right]) when left < right, do: left

  def min([left, right | tail]) when left >= right do
    min([right | tail])
  end

  def min([left, right | tail]) when left < right do
    min([left| tail])
  end
end
