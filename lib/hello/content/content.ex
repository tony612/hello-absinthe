defmodule Hello.Content do
  import Ecto.Query

  alias Hello.{Repo, Content}

  def list_posts() do
    from(t in Content.Post)
    |> Repo.all
  end
end
