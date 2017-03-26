defmodule Daily.Repo.Migrations.AddRoomToSong do
  use Ecto.Migration

  def change do
    alter table(:songs) do
      add :room_id, :integer
    end
    create index(:songs, [:room_id])
  end
end
