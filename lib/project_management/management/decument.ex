defmodule ProjectManagement.Management.Decument do
  use Ecto.Schema
  import Ecto.Changeset

  schema "documents" do
    field :name, :string
    field :content, :string
    field :view_content, :integer
    field :published, :boolean

    belongs_to :project, ProjectManagement.Management.Project

    timestamps()
  end

  @doc false
  def changeset(decument, attrs) do
    decument
    |> cast(attrs, [:name, :content, :view_content, :published, :project_id])
    |> validate_required([:name])
  end
end
