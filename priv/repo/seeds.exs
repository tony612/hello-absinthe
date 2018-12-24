# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Hello.Repo.insert!(%Hello.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Hello.{Accounts, Content}

user =
  %Accounts.User{}
  |> Accounts.User.changeset(%{name: "Test", email: "test@example.com"})
  |> Hello.Repo.insert!

Content.create_post(user, %{title: "Test Post", body: "Lorem Ipsum", published_at: ~N[2018-12-25 10:00:00]})
