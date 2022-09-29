defmodule Saas101.Canchas do
  @moduledoc """
  The Canchas context.
  """

  import Ecto.Query, warn: false
  alias Saas101.Repo

  alias Saas101.Turnos.Turno

  @doc """
  Returns the list of turnos.

  ## Examples

      iex> list_turnos()
      [%Turno{}, ...]

  """
  def list_turnos(prefix) do
    Repo.all(Turno, prefix: prefix)
  end

  @doc """
  Gets a single turno.

  Raises `Ecto.NoResultsError` if the Turno does not exist.

  ## Examples

      iex> get_turno!(123)
      %Turno{}

      iex> get_turno!(456)
      ** (Ecto.NoResultsError)

  """
  def get_turno!(id, prefix), do: Repo.get!(Turno, id, prefix: prefix)

  @doc """
  Creates a turno.

  ## Examples

      iex> create_turno(%{field: value})
      {:ok, %Turno{}}

      iex> create_turno(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_turno(attrs \\ %{}, prefix) do
    %Turno{}
    |> Turno.changeset(attrs)
    |> Repo.insert(prefix: prefix)
  end

  @doc """
  Updates a turno.

  ## Examples

      iex> update_turno(turno, %{field: new_value})
      {:ok, %Turno{}}

      iex> update_turno(turno, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_turno(%Turno{} = turno, attrs, prefix) do
    turno
    |> Turno.changeset(attrs)
    |> Repo.update(prefix: prefix)
  end

  @doc """
  Deletes a turno.

  ## Examples

      iex> delete_turno(turno)
      {:ok, %Turno{}}

      iex> delete_turno(turno)
      {:error, %Ecto.Changeset{}}

  """
  def delete_turno(%Turno{} = turno, prefix) do
    Repo.delete(turno, prefix: prefix)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking turno changes.

  ## Examples

      iex> change_turno(turno)
      %Ecto.Changeset{data: %Turno{}}

  """
  def change_turno(%Turno{} = turno, attrs \\ %{}) do
    Turno.changeset(turno, attrs)
  end
end
