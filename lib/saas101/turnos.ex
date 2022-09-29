defmodule Saas101.Turnos do
  @moduledoc """
  The Turnos context.
  """

  import Ecto.Query, warn: false
  alias Saas101.Repo

  alias Saas101.Turnos.Horario

  @doc """
  Returns the list of horarios.

  ## Examples

      iex> list_horarios()
      [%Horario{}, ...]

  """
  def list_horarios(prefix) do
    Repo.all(Horario, prefix: prefix)
  end

  @doc """
  Gets a single horario.

  Raises `Ecto.NoResultsError` if the Horario does not exist.

  ## Examples

      iex> get_horario!(123)
      %Horario{}

      iex> get_horario!(456)
      ** (Ecto.NoResultsError)

  """
  def get_horario!(id, prefix), do: Repo.get!(Horario, id, prefix: prefix)

  @doc """
  Creates a horario.

  ## Examples

      iex> create_horario(%{field: value})
      {:ok, %Horario{}}

      iex> create_horario(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_horario(attrs \\ %{}, prefix) do
    %Horario{}
    |> Horario.changeset(attrs)
    |> Repo.insert(prefix: prefix)
  end

  @doc """
  Updates a horario.

  ## Examples

      iex> update_horario(horario, %{field: new_value})
      {:ok, %Horario{}}

      iex> update_horario(horario, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_horario(%Horario{} = horario, attrs, prefix) do
    horario
    |> Horario.changeset(attrs)
    |> Repo.update(prefix: prefix)
  end

  @doc """
  Deletes a horario.

  ## Examples

      iex> delete_horario(horario)
      {:ok, %Horario{}}

      iex> delete_horario(horario)
      {:error, %Ecto.Changeset{}}

  """
  def delete_horario(%Horario{} = horario, prefix) do
    Repo.delete(horario, prefix: prefix)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking horario changes.

  ## Examples

      iex> change_horario(horario)
      %Ecto.Changeset{data: %Horario{}}

  """
  def change_horario(%Horario{} = horario, attrs \\ %{}) do
    Horario.changeset(horario, attrs)
  end

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
