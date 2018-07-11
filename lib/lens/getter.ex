defmodule Elixirdo.Lens.Getter do
  alias Elixirdo.Lens.Instance.Const

  # ((a -> Const a a) -> (s -> Const a s)), s) :: a
  def view(getter, s) do
    s_const_as = getter.(fn a -> Const.new(a) end)
    Const.run(s_const_as.(s))
  end
end
