defmodule Blatant.Content.Author do
  use Ecto.Schema
  import Ecto.Changeset

  alias Blatant.Accounts.User

  schema "authors" do
    field :bio, :string
    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(author, attrs) do
    author
    |> cast(attrs, [:bio])
    |> validate_required([:bio])
    |> unique_constraint(:user_id)
  end
end
