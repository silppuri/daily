defmodule Daily.Room do
  use Daily.Web, :model

  schema "rooms" do
    field :name, :string
    field :secret, :string
    field :description, :string
    field :daily_time, :string

    has_many :songs, Daily.Song
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :secret, :description, :daily_time])
    |> validate_required([:name, :secret, :description, :daily_time])
  end
end
