defmodule Blatant.Repo.Migrations.AddPublishedAtToPosts do
  use Ecto.Migration

  def change do
    alter table(:posts) do
      add :published_at, :naive_datetime
    end

    create index(:posts, [:published_at])
  end
end
