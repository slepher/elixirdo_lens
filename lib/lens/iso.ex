defmodule Elixirdo.Lens.Iso do
  alias Elixirdo.Typeclass.Functor
  alias Elixirdo.Lens.Typeclass.Profunctor

  def iso(sa, bt) do
    Profunctor.dimap(sa, &Functor.fmap(bt, &1))
  end
end
