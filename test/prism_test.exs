defmodule PrismTest do
  use ExUnit.Case
  doctest Elixirdo.Lens.Prism

  use Elixirdo.Instance.Either
  alias Elixirdo.Lens.Prism
  alias Elixirdo.Lens.Fold
  alias Elixirdo.Lens.Setter

  @moduletag timeout: 1000

  test "prism" do
    prism =
      Prism.prism(&Right.new/1, fn
        %Right{} = right -> right
        %Left{} = left -> Left.new(left)
      end)

    assert [1] == Fold.to_list_of(prism, Right.new(1))
    assert Right.new(:world) == Setter.set(prism, :world, Right.new(:hello))
    assert Left.new(:hello) == Setter.set(prism, :world, Left.new(:hello))
  end
end
