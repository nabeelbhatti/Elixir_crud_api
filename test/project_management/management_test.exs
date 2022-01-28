defmodule ProjectManagement.ManagementTest do
  use ProjectManagement.DataCase

  alias ProjectManagement.Management

  describe "projects" do
    alias ProjectManagement.Management.Project

    import ProjectManagement.ManagementFixtures

    @invalid_attrs %{description: nil, title: nil}

    test "list_projects/0 returns all projects" do
      project = project_fixture()
      assert Management.list_projects() == [project]
    end

    test "get_project!/1 returns the project with given id" do
      project = project_fixture()
      assert Management.get_project!(project.id) == project
    end

    test "create_project/1 with valid data creates a project" do
      valid_attrs = %{description: "some description", title: "some title"}

      assert {:ok, %Project{} = project} = Management.create_project(valid_attrs)
      assert project.description == "some description"
      assert project.title == "some title"
    end

    test "create_project/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Management.create_project(@invalid_attrs)
    end

    test "update_project/2 with valid data updates the project" do
      project = project_fixture()
      update_attrs = %{description: "some updated description", title: "some updated title"}

      assert {:ok, %Project{} = project} = Management.update_project(project, update_attrs)
      assert project.description == "some updated description"
      assert project.title == "some updated title"
    end

    test "update_project/2 with invalid data returns error changeset" do
      project = project_fixture()
      assert {:error, %Ecto.Changeset{}} = Management.update_project(project, @invalid_attrs)
      assert project == Management.get_project!(project.id)
    end

    test "delete_project/1 deletes the project" do
      project = project_fixture()
      assert {:ok, %Project{}} = Management.delete_project(project)
      assert_raise Ecto.NoResultsError, fn -> Management.get_project!(project.id) end
    end

    test "change_project/1 returns a project changeset" do
      project = project_fixture()
      assert %Ecto.Changeset{} = Management.change_project(project)
    end
  end

  describe "documents" do
    alias ProjectManagement.Management.Decument

    import ProjectManagement.ManagementFixtures

    @invalid_attrs %{}

    test "list_documents/0 returns all documents" do
      decument = decument_fixture()
      assert Management.list_documents() == [decument]
    end

    test "get_decument!/1 returns the decument with given id" do
      decument = decument_fixture()
      assert Management.get_decument!(decument.id) == decument
    end

    test "create_decument/1 with valid data creates a decument" do
      valid_attrs = %{}

      assert {:ok, %Decument{} = decument} = Management.create_decument(valid_attrs)
    end

    test "create_decument/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Management.create_decument(@invalid_attrs)
    end

    test "update_decument/2 with valid data updates the decument" do
      decument = decument_fixture()
      update_attrs = %{}

      assert {:ok, %Decument{} = decument} = Management.update_decument(decument, update_attrs)
    end

    test "update_decument/2 with invalid data returns error changeset" do
      decument = decument_fixture()
      assert {:error, %Ecto.Changeset{}} = Management.update_decument(decument, @invalid_attrs)
      assert decument == Management.get_decument!(decument.id)
    end

    test "delete_decument/1 deletes the decument" do
      decument = decument_fixture()
      assert {:ok, %Decument{}} = Management.delete_decument(decument)
      assert_raise Ecto.NoResultsError, fn -> Management.get_decument!(decument.id) end
    end

    test "change_decument/1 returns a decument changeset" do
      decument = decument_fixture()
      assert %Ecto.Changeset{} = Management.change_decument(decument)
    end
  end
end
