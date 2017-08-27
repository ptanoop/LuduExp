defmodule LuduExpWeb.UserController do
  use LuduExpWeb, :controller

  def show(conn, %{"id" => user_id}) do
    conn |> text(user_id)
  end

end
