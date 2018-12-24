defmodule Hello.Accounts do

  alias Hello.{Accounts, Repo}

  def find_user(id) do
    Repo.get(Accounts.User, id)
  end

end
