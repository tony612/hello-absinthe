defmodule Hello.Content.Post do
  use Ecto.Schema
  import Ecto.Changeset

  alias Hello.Content

  schema "posts" do
    field :body, :string
    field :title, :string
    field :published_at, :naive_datetime

    belongs_to :user, Hello.Accounts.User, foreign_key: :author_id

    timestamps()
  end

  @doc false
  def changeset(%Content.Post{} = post, attrs) do
    post
    |> cast(attrs, [:title, :body, :published_at])
    |> validate_required([:title, :body, :published_at])
  end
end
