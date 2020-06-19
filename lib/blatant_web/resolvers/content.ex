defmodule BlatantWeb.Resolvers.Content do
  def list_posts(_parent, _args, _resolution) do
    {:ok, Blatant.Content.list_posts()}
  end

  def find_author(_parent, %{id: id}, _resolution) do
    case Blatant.Content.find_author(id) do
      nil ->
        {:error, "Author ID #{id} not found"}
      author ->
        {:ok, author}
    end
  end
end
