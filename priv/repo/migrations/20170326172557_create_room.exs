defmodule Daily.Repo.Migrations.CreateRoom do
  use Ecto.Migration

  def change do
    create table(:rooms) do
      add :name, :string
      add :secret, :string
      add :description, :text
      add :daily_time, :text

      timestamps()
    end

  end
end
