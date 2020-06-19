defmodule Blatant.Content.Post do
  use Ecto.Schema
  import Ecto.Changeset

  alias Blatant.Content.Author

  schema "posts" do
    field :body, :string
    field :title, :string
    belongs_to :author, Author

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :body])
    |> validate_required([:title, :body, :author])
  end
end
