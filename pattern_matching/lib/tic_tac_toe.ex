defmodule TicTacToe do
  def winner({
        :x, _, _,
        :x, _, _,
        :x, _, _
      }) do
    { :winner, :x }
  end
  def winner({
        _, :x, _,
        _, :x, _,
        _, :x, _
      }) do
    { :winner, :x }
  end
  def winner({
        _, _, :x,
        _, _, :x,
        _, _, :x,
      }) do
    { :winner, :x }
  end
  def winner({
        _, _, :x,
        _, :x, _,
        :x, _, _,
      }) do
    { :winner, :x }
  end
  def winner({
        :x, _, _,
        _, :x, _,
        _, _, :x,
      }) do
    { :winner, :x }
  end
  def winner({
        :x, :x, :x,
        _, _, _,
        _, _, _,
      }) do
    { :winner, :x }
  end
  def winner({
        _, _, _,
        :x, :x, :x,
        _, _, _,
      }) do
    { :winner, :x }
  end
  def winner({
        _, _, _,
        _, _, _,
        :x, :x, :x,
      }) do
    { :winner, :x }
  end
  def winner({
        :o, _, _,
        :o, _, _,
        :o, _, _
      }) do
    { :winner, :o }
  end
  def winner({
        _, :o, _,
        _, :o, _,
        _, :o, _
      }) do
    { :winner, :o }
  end
  def winner({
        _, _, :o,
        _, _, :o,
        _, _, :o,
      }) do
    { :winner, :o }
  end
  def winner({
        _, _, :o,
        _, :o, _,
        :o, _, _,
      }) do
    { :winner, :o }
  end
  def winner({
        :o, _, _,
        _, :o, _,
        _, _, :o,
      }) do
    { :winner, :o }
  end
  def winner({
        :o, :o, :o,
        _, _, _,
        _, _, _,
      }) do
    { :winner, :o }
  end
  def winner({
        _, _, _,
        :o, :o, :o,
        _, _, _,
      }) do
    { :winner, :o }
  end
  def winner({
        _, _, _,
        _, _, _,
        :o, :o, :o,
      }) do
    { :winner, :o }
  end


  def winner({_,_,_,_,_,_,_,_,_,}) do
    :no_winner
  end
end
