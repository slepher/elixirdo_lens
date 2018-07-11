defmodule Elixirdo.Lens.Typeclass.Choice do
  use Elixirdo.Base
  use Elixirdo.Instance.Either

  alias Elixirdo.Lens.Typeclass.Profunctor

  defmacro __using__(opts) do
    quote do
      use Elixirdo.Lens.Typeclass.Profunctor, unquote(opts)
      alias Elixirdo.Lens.Typeclass.Choice
      unquote_splicing(__using_import__(opts))
    end
  end

  defclass choice(p, p: profunctor) do
    def left(pab: p(a, b)) :: p(Either.either(c, a), Either.either(c, b)) do
      Profunctor.dimap(swap_either(), swap_either(), p).(right(pab, p))
    end

    def right(pab: p(a, b)) :: p(Either.either(a, c), Either.either(b, c)) do
      Profunctor.dimap(swap_either(), swap_either(), p).(left(pab, p))
    end
  end

  def swap_either() do
    Either.either(&Right.new/1, &Left.new/1)
  end
end
