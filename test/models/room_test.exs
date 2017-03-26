defmodule Daily.RoomTest do
  use Daily.ModelCase

  alias Daily.Room

  @valid_attrs %{daily_time: "some content", description: "some content", name: "some content", secret: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Room.changeset(%Room{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Room.changeset(%Room{}, @invalid_attrs)
    refute changeset.valid?
  end
end
