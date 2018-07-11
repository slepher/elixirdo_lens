defmodule Elixirdo.Lens.Instance.Const do
  alias Elixirdo.Lens.Instance.Const
  alias Elixirdo.Typeclass.Monoid

  use Elixirdo.Base
  use Elixirdo.Typeclass.Applicative, import_typeclasses: true

  defstruct [:data]

  deftype const(r, _a) :: %Const{data: r}

  def new(r) do
    %Const{data: r}
  end

  def run(%Const{data: r}) do
    r
  end

  definstance functor(const) do
    def fmap(_f, const_a) do
      const_a
    end
  end

  definstance applicative(const(r, a), r: monoid) do
    def pure(_) do
      new(Monoid.mempty())
    end

    def ap(const_f, const_a) do
      r1 = run(const_f)
      r2 = run(const_a)
      new(Monoid.mappend(r1, r2))
    end
  end

end
