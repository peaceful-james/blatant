defmodule Blatant.Repo.Migrations.CreateAuthors do
  use Ecto.Migration

  def change do
    create table(:authors) do
      add :bio, :text
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:authors, [:user_id])
  end
end
