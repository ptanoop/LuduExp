defmodule LuduExpWeb.ChatController do
  use LuduExpWeb, :controller

  def index(conn, _params) do
    render conn
  end


  plug Guardian.Plug.EnsureAuthenticated, handler: __MODULE__ # module contains unauthenticated method, __MODULE__ means current module

  def unauthenticated(conn, _params) do
    conn
    |> put_flash(:error, "You need to log in to view your messages.")
    |> redirect(to: "/")
  end
  
end
