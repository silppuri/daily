require Logger

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
    Logger.debug(inspect(params))
    struct
    |> cast(params, [:url, :video_id])
    |> validate_required([:url, :video_id])
    |> validate_change(:url, &Validation.uri(&1, &2))
  end

  def latest_video_id do
    Daily.Repo.one(from song in Daily.Song,
      select: [song.video_id],
      order_by: [desc: song.inserted_at],
      limit: 1)
    |> List.first
  end

end
