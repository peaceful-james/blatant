defmodule BlatantWeb.Schema.AccountTypes do
	use Absinthe.Schema.Notation

  @desc "A user"
  object :user, name: "User" do
    field :id, :id
    field :name, :string
    field :username, :string
    field :email, :string
  end

end
