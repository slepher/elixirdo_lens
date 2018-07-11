defmodule Elixirdo.Lens.Traversal do
  alias Elixirdo.Typeclass.Traversable

  def traverse() do
    fn a_fb ->
      fn s ->
        Traversable.traverse(a_fb, s)
      end
    end
  end
end
