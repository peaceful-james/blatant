defmodule Blatant.Content.Author do
  use Ecto.Schema
  import Ecto.Changeset

  alias Blatant.Accounts.User
  alias Blatant.Content.Post

  schema "authors" do
    field :bio, :string
    field :name, :string, virtual: true
    belongs_to :user, User
    has_many :posts, Post

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
