defmodule Blatant.Repo.Migrations.AddAuthorToPosts do
  use Ecto.Migration

  def change do
    drop index(:posts, [:user_id])

    alter table(:posts) do
      remove :user_id
      add :author_id, references(:authors, on_delete: :delete_all), null: false
    end

    create index(:posts, [:author_id])
  end
end
