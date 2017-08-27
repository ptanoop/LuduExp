defmodule LuduExp.Accounts.Session do

  alias LuduExp.Accounts.User
  alias LuduExp.Repo

  def authenticate(%{"username" => username, "password" => given_password}) do
  	user = Repo.get_by(User, username: username)
    IO.puts(user.username)
    check_password(user, given_password)
  end

  defp check_password(nil, _givenpassword) do
    {:error, "No User here"}
  end

  defp check_password(%{encrypted_password: encrypted_password} = user, given_password) do
    case Comeonin.Bcrypt.checkpw(given_password, encrypted_password) do
      true -> {:ok, user}
      _   -> {:error, "Incorrect password"}
    end
  end

end
