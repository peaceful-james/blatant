defmodule BlatantWeb.Schema.ContentTypes do
	use Absinthe.Schema.Notation

  alias BlatantWeb.Resolvers

  object :post, name: "Post" do
    field :id, :id
    field :title, :string
    field :body, :string
    field :author, :author
  end

  @desc "An author of some post(s)"
  object :author do
    field :id, :id
    field :bio, :string
    field :posts, list_of(:post) do
      resolve &Resolvers.Content.list_posts/3
    end
    field :user, :user
  end

end
