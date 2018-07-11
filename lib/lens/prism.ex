defmodule Elixirdo.Lens.Prism do
  alias Elixirdo.Instance.Either
  alias Elixirdo.Instance.Function
  alias Elixirdo.Typeclass.Functor
  alias Elixirdo.Typeclass.Applicative
  alias Elixirdo.Lens.Typeclass.Profunctor
  alias Elixirdo.Lens.Typeclass.Choice

  def prism(fbt, f_s_either_t_a) do
    # functor:fmap(BT) :: f b -> f t
    # applicative:pure(_) :: t -> f t
    # either:either(applicative:pure(_), functor:fmap(BT)) :: Either t (f b) -> f t
    # SETA :: s -> Either t a
    # dimap(SETA, either) :: p (Either t a) (Either t (f b)) -> p s -> f t
    # right :: p a (f b) -> p (Either t a) (Either t (f b))
    # final type is p a (f b) -> p s (f t)
    Profunctor.dimap(f_s_either_t_a, Either.either(&Applicative.pure/1, &Functor.fmap(fbt, &1))) |> Function.c(&Choice.right/1)
  end
end
