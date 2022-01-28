defmodule ProjectManagementWeb.PageController do
  use ProjectManagementWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
