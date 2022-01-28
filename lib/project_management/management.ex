defmodule ProjectManagement.Management do
  @moduledoc """
  The Management context.
  """

  import Ecto.Query, warn: false
  alias ProjectManagement.Repo

  alias ProjectManagement.Management.Project

  @doc """
  Returns the list of projects.

  ## Examples

      iex> list_projects()
      [%Project{}, ...]

  """
  def list_projects do
    Repo.all(Project)
  end

  @doc """
  Gets a single project.

  Raises `Ecto.NoResultsError` if the Project does not exist.

  ## Examples

      iex> get_project!(123)
      %Project{}

      iex> get_project!(456)
      ** (Ecto.NoResultsError)

  """
  def get_project!(id), do: Repo.get!(Project, id)

  @doc """
  Creates a project.

  ## Examples

      iex> create_project(%{field: value})
      {:ok, %Project{}}

      iex> create_project(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_project(attrs \\ %{}) do
    %Project{}
    |> Project.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a project.

  ## Examples

      iex> update_project(project, %{field: new_value})
      {:ok, %Project{}}

      iex> update_project(project, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_project(%Project{} = project, attrs) do
    project
    |> Project.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a project.

  ## Examples

      iex> delete_project(project)
      {:ok, %Project{}}

      iex> delete_project(project)
      {:error, %Ecto.Changeset{}}

  """
  def delete_project(%Project{} = project) do
    Repo.delete(project)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking project changes.

  ## Examples

      iex> change_project(project)
      %Ecto.Changeset{data: %Project{}}

  """
  def change_project(%Project{} = project, attrs \\ %{}) do
    Project.changeset(project, attrs)
  end

  alias ProjectManagement.Management.Decument

  @doc """
  Returns the list of documents.

  ## Examples

      iex> list_documents()
      [%Decument{}, ...]

  """
  def list_documents do
    Repo.all(Decument)
  end

  @doc """
  Gets a single decument.

  Raises `Ecto.NoResultsError` if the Decument does not exist.

  ## Examples

      iex> get_decument!(123)
      %Decument{}

      iex> get_decument!(456)
      ** (Ecto.NoResultsError)

  """
  def get_decument!(id), do: Repo.get!(Decument, id)

  @doc """
  Creates a decument.

  ## Examples

      iex> create_decument(%{field: value})
      {:ok, %Decument{}}

      iex> create_decument(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_decument(attrs \\ %{}) do
    %Decument{}
    |> Decument.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a decument.

  ## Examples

      iex> update_decument(decument, %{field: new_value})
      {:ok, %Decument{}}

      iex> update_decument(decument, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_decument(%Decument{} = decument, attrs) do
    decument
    |> Decument.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a decument.

  ## Examples

      iex> delete_decument(decument)
      {:ok, %Decument{}}

      iex> delete_decument(decument)
      {:error, %Ecto.Changeset{}}

  """
  def delete_decument(%Decument{} = decument) do
    Repo.delete(decument)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking decument changes.

  ## Examples

      iex> change_decument(decument)
      %Ecto.Changeset{data: %Decument{}}

  """
  def change_decument(%Decument{} = decument, attrs \\ %{}) do
    Decument.changeset(decument, attrs)
  end
end
