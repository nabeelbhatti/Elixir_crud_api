defmodule ProjectManagement.ManagementFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ProjectManagement.Management` context.
  """

  @doc """
  Generate a project.
  """
  def project_fixture(attrs \\ %{}) do
    {:ok, project} =
      attrs
      |> Enum.into(%{
        description: "some description",
        title: "some title"
      })
      |> ProjectManagement.Management.create_project()

    project
  end

  @doc """
  Generate a decument.
  """
  def decument_fixture(attrs \\ %{}) do
    {:ok, decument} =
      attrs
      |> Enum.into(%{

      })
      |> ProjectManagement.Management.create_decument()

    decument
  end
end
