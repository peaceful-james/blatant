defmodule Blatant.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias Blatant.Accounts.Credential
  alias Blatant.Content.Post

  schema "users" do
    field :name, :string
    field :username, :string
    has_one :credential, Credential
    has_many :posts, Post

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :username])
    |> validate_required([:name, :username])
    |> unique_constraint(:username)
  end
end
