defmodule ProjectManagement.Repo.Migrations.CreateDocuments do
  use Ecto.Migration

  def change do
    create table(:documents) do
      add :project_id, reference(:projects)
      add :name, :string
      add :content, :text
      add :view_content, :integer
      add :published, :boolean, default: false
      timestamps()
    end
  end
end
