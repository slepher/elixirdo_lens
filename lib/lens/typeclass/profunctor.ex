defmodule Elixirdo.Lens.Typeclass.Profunctor do
  use Elixirdo.Base
  alias Elixirdo.Instance.Function

  defmacro __using__(opts) do
    quote do
      alias Elixirdo.Lens.Typeclass.Profunctor
      unquote_splicing(__using_import__(opts))
    end
  end

  defclass profunctor p do
    def lmap(fab: (a -> b)) :: (p(b, c) -> p(a, c)) do
      dimap(fab, Function.id, p)
    end
    def rmap(fbc: (b -> c)) :: (p(a, b) -> p(a, c)) do
      dimap(Function.id, fbc, p)
    end

    def dimap(fab: (a -> b), fcd: (c -> d)) :: (p(b, c) -> p(a, d)) do
      Function.c(lmap(fab, p), rmap(fcd, p))
    end
  end
end
