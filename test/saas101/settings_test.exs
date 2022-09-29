defmodule Saas101.SettingsTest do
  use Saas101.DataCase

  alias Saas101.Settings

  describe "venues" do
    alias Saas101.Settings.Venue

    import Saas101.SettingsFixtures

    @invalid_attrs %{name: nil}

    test "list_venues/0 returns all venues" do
      venue = venue_fixture()
      assert Settings.list_venues() == [venue]
    end

    test "get_venue!/1 returns the venue with given id" do
      venue = venue_fixture()
      assert Settings.get_venue!(venue.id) == venue
    end

    test "create_venue/1 with valid data creates a venue" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Venue{} = venue} = Settings.create_venue(valid_attrs)
      assert venue.name == "some name"
    end

    test "create_venue/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Settings.create_venue(@invalid_attrs)
    end

    test "update_venue/2 with valid data updates the venue" do
      venue = venue_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Venue{} = venue} = Settings.update_venue(venue, update_attrs)
      assert venue.name == "some updated name"
    end

    test "update_venue/2 with invalid data returns error changeset" do
      venue = venue_fixture()
      assert {:error, %Ecto.Changeset{}} = Settings.update_venue(venue, @invalid_attrs)
      assert venue == Settings.get_venue!(venue.id)
    end

    test "delete_venue/1 deletes the venue" do
      venue = venue_fixture()
      assert {:ok, %Venue{}} = Settings.delete_venue(venue)
      assert_raise Ecto.NoResultsError, fn -> Settings.get_venue!(venue.id) end
    end

    test "change_venue/1 returns a venue changeset" do
      venue = venue_fixture()
      assert %Ecto.Changeset{} = Settings.change_venue(venue)
    end
  end

  describe "courts" do
    alias Saas101.Settings.Court

    import Saas101.SettingsFixtures

    @invalid_attrs %{name: nil}

    test "list_courts/0 returns all courts" do
      court = court_fixture()
      assert Settings.list_courts() == [court]
    end

    test "get_court!/1 returns the court with given id" do
      court = court_fixture()
      assert Settings.get_court!(court.id) == court
    end

    test "create_court/1 with valid data creates a court" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Court{} = court} = Settings.create_court(valid_attrs)
      assert court.name == "some name"
    end

    test "create_court/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Settings.create_court(@invalid_attrs)
    end

    test "update_court/2 with valid data updates the court" do
      court = court_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Court{} = court} = Settings.update_court(court, update_attrs)
      assert court.name == "some updated name"
    end

    test "update_court/2 with invalid data returns error changeset" do
      court = court_fixture()
      assert {:error, %Ecto.Changeset{}} = Settings.update_court(court, @invalid_attrs)
      assert court == Settings.get_court!(court.id)
    end

    test "delete_court/1 deletes the court" do
      court = court_fixture()
      assert {:ok, %Court{}} = Settings.delete_court(court)
      assert_raise Ecto.NoResultsError, fn -> Settings.get_court!(court.id) end
    end

    test "change_court/1 returns a court changeset" do
      court = court_fixture()
      assert %Ecto.Changeset{} = Settings.change_court(court)
    end
  end
end
