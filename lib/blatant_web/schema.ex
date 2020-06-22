defmodule BlatantWeb.Schema do
  use Absinthe.Schema
  import_types Absinthe.Type.Custom
  import_types BlatantWeb.Schema.AccountTypes
  import_types BlatantWeb.Schema.ContentTypes

  alias BlatantWeb.Resolvers

  query do
    @desc "get all posts"
    field :posts, list_of(:post) do
      resolve &Resolvers.Content.list_posts/3
    end

    @desc "get an author"
    field :author, :author do
      arg :id, non_null(:id)
      resolve &Resolvers.Content.find_author/3
    end

    @desc "get a user"
    field :user, :user do
      arg :id, non_null(:id)
      resolve &Resolvers.Accounts.find_user/3
    end

  end

  mutation do
    @desc "create a post"
    field :create_post, type: :post do
      arg :title, non_null(:string)
      arg :body, non_null(:string)
      arg :published_at, :naive_datetime
      arg :author_id, :id

      resolve &Resolvers.Content.create_post/3
    end
  end

end
