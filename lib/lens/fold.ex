defmodule Elixirdo.Lens.Fold do
  alias Elixirdo.Lens.Instance.Const
  alias Elixirdo.Base.Undetermined

  ## (((a -> Const [a] a) -> (s -> Const [a] s)), s) :: [a]
  def to_list_of(fold, s) do
    s_const_a = fold.(fn a -> Const.new([a]) end)
    Undetermined.run(Const.run(s_const_a.(s)), :list)
  end

    ## (((a -> Const r a) -> (s -> Const r s)), (a -> r), s) :: r
  def fold_map_of(fold, ar, s) do
    s_const_r = fold.(fn a -> Const.new(ar.(a)) end)
    Const.run(s_const_r.(s))
  end
end
