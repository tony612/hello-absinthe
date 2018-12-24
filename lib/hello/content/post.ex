defmodule Hello.Content.Post do
  use Ecto.Schema
  import Ecto.Changeset

  alias Hello.Content

  schema "posts" do
    field :body, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(%Content.Post{} = post, attrs) do
    post
    |> cast(attrs, [:title, :body])
    |> validate_required([:title, :body])
  end
end
