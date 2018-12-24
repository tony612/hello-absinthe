defmodule Hello.Content do
  import Ecto.Query

  alias Hello.{Repo, Content}

  def list_posts(author, %{date: date}) do
    from(t in Content.Post,
      where: t.author_id == ^author.id,
      where: fragment("date_trunc('day', ?)", t.published_at) == type(^date, :date))
    |> Repo.all
  end
  def list_posts(author, _) do
    from(t in Content.Post, where: t.author_id == ^author.id)
    |> Repo.all
  end

  def list_posts() do
    Repo.all(Content.Post)
  end
end
