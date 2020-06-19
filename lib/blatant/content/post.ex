defmodule Blatant.Content.Post do
  use Ecto.Schema
  import Ecto.Changeset

  alias Blatant.Accounts.User

  schema "posts" do
    field :body, :string
    field :title, :string
    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :body])
    |> validate_required([:title, :body])
  end
end
