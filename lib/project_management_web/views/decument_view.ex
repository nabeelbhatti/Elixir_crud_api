defmodule ProjectManagementWeb.DecumentView do
  use ProjectManagementWeb, :view
  alias ProjectManagementWeb.DecumentView

  def render("index.json", %{documents: documents}) do
    %{data: render_many(documents, DecumentView, "decument.json")}
  end

  def render("show.json", %{decument: decument}) do
    %{data: render_one(decument, DecumentView, "decument.json")}
  end

  def render("decument.json", %{decument: decument}) do
    %{
      id: decument.id,
      name: decument.name,
      content: decument.content,
      published: decument.published,
      view_content: decument.view_content
    }
  end
end
