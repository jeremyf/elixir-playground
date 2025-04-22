defmodule ScrewsFactory do
  def pieces do
    Enum.take(Stream.cycle(["-"]), 1000)
  end
  def run(pieces) do
    pieces
    |> Enum.map(&add_thread/1)
    |> Enum.map(&add_head/1)
    |> Enum.each(&output/1)
  end

  # In this function, we're relying on streaming to create non-blocking
  def stream_run(pieces) do
    pieces
    |> Stream.map(&add_thread/1)
    |> Stream.map(&add_head/1)
    |> Enum.each(&output/1)
  end

  def run_more(pieces) do
    pieces
    |> Stream.chunk_every(50)
    |> Stream.flat_map(&add_thread_chunked/1)
    |> Stream.chunk_every(100)
    |> Stream.flat_map(&add_head_chunked/1)
    |> Enum.each(&output/1)
  end

  def add_thread_chunked(pieces) do
    Process.sleep(50)
    Enum.map(pieces, &(&1 <> "--"))
  end

  def add_thread(piece) do
    Process.sleep(50)
    piece <> "--"
  end

  def add_head(piece) do
    Process.sleep(100)
    "o" <> piece
  end

  def add_head_chunked(pieces) do
    Process.sleep(10)
    Enum.map(pieces, &("o" <> &1))
  end


  def output(screw) do
    IO.inspect(screw)
  end
end
