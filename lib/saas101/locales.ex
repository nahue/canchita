defmodule Saas101.Locales do
  @moduledoc """
  The Locales context.
  """

  import Ecto.Query, warn: false
  alias Saas101.Repo

  alias Saas101.Locales.Cancha

  @doc """
  Returns the list of canchas.

  ## Examples

      iex> list_canchas()
      [%Cancha{}, ...]

  """
  def list_canchas(prefix) do
    Repo.all(Cancha, prefix: prefix) |> Repo.preload([:local])
  end

  @doc """
  Gets a single cancha.

  Raises `Ecto.NoResultsError` if the Cancha does not exist.

  ## Examples

      iex> get_cancha!(123)
      %Cancha{}

      iex> get_cancha!(456)
      ** (Ecto.NoResultsError)

  """
  def get_cancha!(id, prefix), do: Repo.get!(Cancha, id, prefix: prefix) |> Repo.preload([:local])

  @doc """
  Creates a cancha.

  ## Examples

      iex> create_cancha(%{field: value})
      {:ok, %Cancha{}}

      iex> create_cancha(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_cancha(attrs \\ %{}, prefix) do
    %Cancha{}
    |> Cancha.changeset(attrs)
    |> Repo.insert(prefix: prefix)
  end

  @doc """
  Updates a cancha.

  ## Examples

      iex> update_cancha(cancha, %{field: new_value})
      {:ok, %Cancha{}}

      iex> update_cancha(cancha, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_cancha(%Cancha{} = cancha, attrs, prefix) do
    cancha
    |> Cancha.changeset(attrs)
    |> Repo.update(prefix: prefix)
  end

  @doc """
  Deletes a cancha.

  ## Examples

      iex> delete_cancha(cancha)
      {:ok, %Cancha{}}

      iex> delete_cancha(cancha)
      {:error, %Ecto.Changeset{}}

  """
  def delete_cancha(%Cancha{} = cancha, prefix) do
    Repo.delete(cancha, prefix: prefix)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking cancha changes.

  ## Examples

      iex> change_cancha(cancha)
      %Ecto.Changeset{data: %Cancha{}}

  """
  def change_cancha(%Cancha{} = cancha, attrs \\ %{}) do
    Cancha.changeset(cancha, attrs)
  end

  alias Saas101.Locales.Local

  @doc """
  Returns the list of locales.

  ## Examples

      iex> list_locales()
      [%Local{}, ...]

  """
  def list_locales(prefix) do
    Repo.all(Local, prefix: prefix)
  end

  @doc """
  Gets a single local.

  Raises `Ecto.NoResultsError` if the Local does not exist.

  ## Examples

      iex> get_local!(123)
      %Local{}

      iex> get_local!(456)
      ** (Ecto.NoResultsError)

  """
  def get_local!(id, prefix), do: Repo.get!(Local, id, prefix: prefix)

  @doc """
  Creates a local.

  ## Examples

      iex> create_local(%{field: value})
      {:ok, %Local{}}

      iex> create_local(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_local(attrs \\ %{}, prefix) do
    %Local{}
    |> Local.changeset(attrs)
    |> Repo.insert(prefix: prefix)
  end

  @doc """
  Updates a local.

  ## Examples

      iex> update_local(local, %{field: new_value})
      {:ok, %Local{}}

      iex> update_local(local, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_local(%Local{} = local, attrs, prefix) do
    local
    |> Local.changeset(attrs)
    |> Repo.update(prefix: prefix)
  end

  @doc """
  Deletes a local.

  ## Examples

      iex> delete_local(local)
      {:ok, %Local{}}

      iex> delete_local(local)
      {:error, %Ecto.Changeset{}}

  """
  def delete_local(%Local{} = local, prefix) do
    Repo.delete(local, prefix: prefix)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking local changes.

  ## Examples

      iex> change_local(local)
      %Ecto.Changeset{data: %Local{}}

  """
  def change_local(%Local{} = local, attrs \\ %{}) do
    Local.changeset(local, attrs)
  end
end
