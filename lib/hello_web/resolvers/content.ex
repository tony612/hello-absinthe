defmodule HelloWeb.Resolvers.Content do

  def list_posts(_parent, _args, _resolution) do
    {:ok, Hello.Content.list_posts()}
  end

end
