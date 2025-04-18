defmodule CharacterBuild do
  def cost(%{str: str, dex: dex, int: int}) when str >=0 and dex >=0 and int >=0 do
    str * 2 + dex*3 + int*3
  end
end
