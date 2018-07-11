defmodule Elixirdo.Lens.Setter do
  alias Elixirdo.Instance.Identity
  alias Elixirdo.Instance.Function
  alias Elixirdo.Base.Undetermined

  ## ((a -> Identity b) -> (s -> Identity t)), (a -> b), s) :: t
  def over(setter, ab, s) do
    a_identity_b = fn a -> Identity.new(ab.(a)) end
    s_identity_t = setter.(a_identity_b)
    Identity.run(Undetermined.run(s_identity_t.(s), :identity))
  end

  def set(setter, b, s) do
    over(setter, Function.const(b), s)
  end
end
