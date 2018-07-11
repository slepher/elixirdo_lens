defmodule Elixirdo.Lens.Lens do
  alias Elixirdo.Typeclass.Functor

  def lens(getter, setter) do
    fn a_fb ->
      fn s ->
        Functor.fmap(fn b -> setter.(s, b) end, a_fb.(getter.(s)))
      end
    end
  end
end
