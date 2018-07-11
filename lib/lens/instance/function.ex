defmodule Elixirdo.Lens.Instance.Function do
  use Elixirdo.Base
  use Elixirdo.Lens.Typeclass.Choice, import_profunctor: true, import_choice: true
  use Elixirdo.Instance.Either

  import Elixirdo.Instance.Function, only: [c: 2]
  import_type Elixirdo.Instance.Function.function

  definstance profunctor(function) do
    def dimap(fab, fcd) do
      fn fbc ->
        fcd |> c(fbc) |> c(fab)
      end
    end
  end

  definstance choice(function) do
    def right(pab) do
      fn either_a ->
        Either.fmap(pab, either_a)
      end
    end
  end

end
