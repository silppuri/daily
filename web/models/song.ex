defmodule Daily.Song do
  use Daily.Web, :model
  require Validation

  schema "songs" do
    field :url, :string
    field :video_id, :string
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:url, :video_id])
    |> validate_required([:url, :video_id])
    |> validate_change(:url, &Validation.uri(&1, &2))
  end
end
