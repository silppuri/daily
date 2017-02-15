defmodule Daily.Repo.Migrations.CreateSong do
  use Ecto.Migration

  def change do
    create table(:songs) do
      add :url, :string

      timestamps()
    end

  end
end
