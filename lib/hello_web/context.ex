defmodule HelloWeb.Context do
  @behaviour Plug

  import Plug.Conn
  import Ecto.Query, only: []

  alias Hello.{Repo, Accounts}

  def init(opts), do: opts

  def call(conn, _) do
    context = build_context(conn)
    put_private(conn, :absinthe, %{context: context})
  end

  @doc """
  Return the current user context based on the authorization header.
  Important: Note that at the current time this is just a stub, always
  returning the first user (marked as an admin), provided any
  authorization header is sent.
  """
  def build_context(conn) do
    with ["Bearer " <> token] <- get_req_header(conn, "authorization"),
         {:ok, current_user} <- authorize(token) do
      %{current_user: current_user}
    else
      _ -> %{}
    end
  end

  # NOTE: This is a stub, just returning the first user and stubbing in the user
  # as an administrator.
  defp authorize(id) do
    case Repo.get_by(Accounts.User, id: id) do
      nil -> {:error, "No users available"}
      user -> {:ok, user}
    end
  end

end
