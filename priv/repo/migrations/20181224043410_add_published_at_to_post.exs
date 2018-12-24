defmodule Hello.Repo.Migrations.AddPublishedAtToPost do
  use Ecto.Migration

  def change do
    alter table(:posts) do
      add :published_at, :naive_datetime
    end
  end
end
