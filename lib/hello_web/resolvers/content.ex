defmodule HelloWeb.Resolvers.Content do

  def list_posts(%Hello.Accounts.User{} = author, args, _resolution) do
    {:ok, Hello.Content.list_posts(author, args)}
  end

  def list_posts(_parent, _args, _resolution) do
    {:ok, Hello.Content.list_posts()}
  end

  def create_post(_parent, args, %{context: %{current_user: user}}) do
    Hello.Content.create_post(user, args)
  end

  def create_post(_parent, _args, _resolution) do
    {:error, "Access denied"}
  end

end
