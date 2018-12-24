defmodule Hello.Repo.Migrations.AddAuthorToPost do
  use Ecto.Migration

  def change do
    alter table(:posts) do
      add :author_id, :integer
    end
    create index(:posts, [:author_id])
  end
end
