defmodule ProjectManagementWeb.DecumentController do
  use ProjectManagementWeb, :controller

  alias ProjectManagement.Management
  alias ProjectManagement.Management.Decument

  action_fallback ProjectManagementWeb.FallbackController

  def index(conn, _params) do
    documents = Management.list_documents()
    render(conn, "index.json", documents: documents)
  end

  def create(conn, %{"decument" => decument_params}) do
    with {:ok, %Decument{} = decument} <- Management.create_decument(decument_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.decument_path(conn, :show, decument))
      |> render("show.json", decument: decument)
    end
  end

  def show(conn, %{"id" => id}) do
    decument = Management.get_decument!(id)
    render(conn, "show.json", decument: decument)
  end

  def update(conn, %{"id" => id, "decument" => decument_params}) do
    decument = Management.get_decument!(id)

    with {:ok, %Decument{} = decument} <- Management.update_decument(decument, decument_params) do
      render(conn, "show.json", decument: decument)
    end
  end

  def delete(conn, %{"id" => id}) do
    decument = Management.get_decument!(id)

    with {:ok, %Decument{}} <- Management.delete_decument(decument) do
      send_resp(conn, :no_content, "")
    end
  end
end
