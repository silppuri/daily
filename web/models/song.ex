defmodule Daily.Song do
  use Daily.Web, :model
  require Validation

  schema "songs" do
    field :url, :string
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:url])
    |> validate_required([:url])
    |> validate_change(:url, &Validation.uri(&1, &2))
  end
end
