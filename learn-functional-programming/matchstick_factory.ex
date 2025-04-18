defmodule MatchstickFactory do
  # An array of tuples that represent the box type and capacity.
  @box_types [ {:big, 50}, {:medium, 20}, {:small, 5} ]

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
end
