defmodule Hello.Repo.Migrations.AddPosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :string, null: false
      add :body, :string, null: false

      timestamps()
    end
  end
end
