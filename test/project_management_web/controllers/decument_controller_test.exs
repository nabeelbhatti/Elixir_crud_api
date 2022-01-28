defmodule ProjectManagementWeb.DecumentControllerTest do
  use ProjectManagementWeb.ConnCase

  import ProjectManagement.ManagementFixtures

  alias ProjectManagement.Management.Decument

  @create_attrs %{

  }
  @update_attrs %{

  }
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all documents", %{conn: conn} do
      conn = get(conn, Routes.decument_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create decument" do
    test "renders decument when data is valid", %{conn: conn} do
      conn = post(conn, Routes.decument_path(conn, :create), decument: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.decument_path(conn, :show, id))

      assert %{
               "id" => ^id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.decument_path(conn, :create), decument: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update decument" do
    setup [:create_decument]

    test "renders decument when data is valid", %{conn: conn, decument: %Decument{id: id} = decument} do
      conn = put(conn, Routes.decument_path(conn, :update, decument), decument: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.decument_path(conn, :show, id))

      assert %{
               "id" => ^id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, decument: decument} do
      conn = put(conn, Routes.decument_path(conn, :update, decument), decument: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete decument" do
    setup [:create_decument]

    test "deletes chosen decument", %{conn: conn, decument: decument} do
      conn = delete(conn, Routes.decument_path(conn, :delete, decument))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.decument_path(conn, :show, decument))
      end
    end
  end

  defp create_decument(_) do
    decument = decument_fixture()
    %{decument: decument}
  end
end
