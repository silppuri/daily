defmodule Daily.SongTest do
  use Daily.ModelCase

  alias Daily.Song

  @empty_attrs %{}
  @invalid_attrs %{url: "asd"}
  @valid_attrs %{url: "https://www.youtube.com/watch?v=_Qz5yhNAZps"}

  test "changeset with empty attributes" do
    changeset = Song.changeset(%Song{}, @empty_attrs)
    refute changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Song.changeset(%Song{}, @invalid_attrs)
    assert !changeset.valid?
  end

  test "changeset with valid attributes" do
    changeset = Song.changeset(%Song{}, @valid_attrs)
    assert changeset.valid?
  end
end
