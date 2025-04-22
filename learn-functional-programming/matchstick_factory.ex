defmodule MatchstickFactory do
  # An array of tuples that represent the box type and capacity.
  @box_types [
     {:big, 50},
     {:medium, 20},
     {:small, 5}
   ]

  # Given a number of matchsticks, we process the box types in order.  Filling a
  # number of boxes of the type based on their capacity.  Then, with any
  # remaing.
  def boxes(matchsticks, box_types \\ @box_types) do
    # A little bit of cheating going on.  While technically not a box, our
    # requirements are such that we need to know the number of match sticks
    # remaining after boxing up the given matchsticks.
    box_types = box_types ++ [{:remaining_matchsticks, 1}]
    {boxes_used_by_type, _} = Enum.reduce(
                                box_types,
                                {%{},matchsticks},
                                fn({box_type, capacity}, {boxes_used_by_type,unboxed_matchsticks}) ->
                                  boxes = div(unboxed_matchsticks, capacity)
                                  boxes_used_by_type = Map.put(boxes_used_by_type, box_type, boxes)
                                  {boxes_used_by_type, unboxed_matchsticks - boxes * capacity}
                                end)
    boxes_used_by_type
  end


  # The `MatchstickFactory.boxes_v2/3` is a recursive implementation of
  # `MatchstickFactory.boxes/2`.  Both result in the same structural output.
  #
  # I find `MatchstickFactory.boxes/3` far easier to read.  In part because I
  # don't need to rely on as many variable names.
  #
  # The header function is provided as an entry point into the recursion.
  def boxes_v2(matchsticks, box_types \\ @box_types, manifest \\ %{})

  def boxes_v2(matchsticks, [{box_type, capacity} | tail], manifest) do
    boxes = div(matchsticks, capacity)
    remaining = matchsticks - boxes * capacity
    manifest = Map.put(manifest, box_type, boxes)
    boxes_v2(remaining, tail, manifest)
  end

  def boxes_v2(matchsticks, [], manifest) do
    Map.put(manifest, :remaining_matchsticks, matchsticks)
  end
end
