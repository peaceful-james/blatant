defmodule BlatantWeb.Schema.ContentTypes do
	use Absinthe.Schema.Notation

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
    field :posts, list_of(:post)
    field :user, :user
  end

end
