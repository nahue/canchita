defmodule Saas101.Settings do
  @moduledoc """
  The Settings context.
  """

  import Ecto.Query, warn: false
  alias Saas101.Repo

  alias Saas101.Settings.Venue

  @doc """
  Returns the list of venues.

  ## Examples

      iex> list_venues()
      [%Venue{}, ...]

  """
  def list_venues(prefix) do
    Repo.all(Venue, prefix: prefix)
  end

  @doc """
  Gets a single venue.

  Raises `Ecto.NoResultsError` if the Venue does not exist.

  ## Examples

      iex> get_venue!(123)
      %Venue{}

      iex> get_venue!(456)
      ** (Ecto.NoResultsError)

  """
  def get_venue!(id, prefix), do: Repo.get!(Venue, id, prefix: prefix) |> Repo.preload([:courts])

  @doc """
  Creates a venue.

  ## Examples

      iex> create_venue(%{field: value})
      {:ok, %Venue{}}

      iex> create_venue(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_venue(attrs \\ %{}, prefix) do
    %Venue{}
    |> Venue.changeset(attrs)
    |> Repo.insert(prefix: prefix)
  end

  @doc """
  Updates a venue.

  ## Examples

      iex> update_venue(venue, %{field: new_value})
      {:ok, %Venue{}}

      iex> update_venue(venue, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_venue(%Venue{} = venue, attrs, prefix) do
    venue
    |> Venue.changeset(attrs)
    |> Repo.update(prefix: prefix)
  end

  @doc """
  Deletes a venue.

  ## Examples

      iex> delete_venue(venue)
      {:ok, %Venue{}}

      iex> delete_venue(venue)
      {:error, %Ecto.Changeset{}}

  """
  def delete_venue(%Venue{} = venue, prefix) do
    Repo.delete(venue, prefix: prefix)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking venue changes.

  ## Examples

      iex> change_venue(venue)
      %Ecto.Changeset{data: %Venue{}}

  """
  def change_venue(%Venue{} = venue, attrs \\ %{}) do
    Venue.changeset(venue, attrs)
  end

  alias Saas101.Settings.Court

  @doc """
  Returns the list of courts.

  ## Examples

      iex> list_courts()
      [%Court{}, ...]

  """
  def list_courts(prefix) do
    Repo.all(Court, prefix: prefix) |> Repo.preload([:venue])
  end

  @doc """
  Gets a single court.

  Raises `Ecto.NoResultsError` if the Court does not exist.

  ## Examples

      iex> get_court!(123)
      %Court{}

      iex> get_court!(456)
      ** (Ecto.NoResultsError)

  """
  def get_court!(id, prefix), do: Repo.get!(Court, id, prefix: prefix) |> Repo.preload([:venue])

  @doc """
  Creates a court.

  ## Examples

      iex> create_court(%{field: value})
      {:ok, %Court{}}

      iex> create_court(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_court(attrs \\ %{}, prefix) do
    %Court{}
    |> Court.changeset(attrs)
    |> Repo.insert(prefix: prefix)
  end

  @doc """
  Updates a court.

  ## Examples

      iex> update_court(court, %{field: new_value})
      {:ok, %Court{}}

      iex> update_court(court, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_court(%Court{} = court, attrs, prefix) do
    court
    |> Court.changeset(attrs)
    |> Repo.update(prefix: prefix)
  end

  @doc """
  Deletes a court.

  ## Examples

      iex> delete_court(court)
      {:ok, %Court{}}

      iex> delete_court(court)
      {:error, %Ecto.Changeset{}}

  """
  def delete_court(%Court{} = court, prefix) do
    Repo.delete(court, prefix: prefix)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking court changes.

  ## Examples

      iex> change_court(court)
      %Ecto.Changeset{data: %Court{}}

  """
  def change_court(%Court{} = court, attrs \\ %{}) do
    Court.changeset(court, attrs)
  end
end
