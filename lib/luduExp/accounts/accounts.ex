defmodule LuduExp.Accounts do

  import Ecto.Changeset
  alias LuduExp.Accounts.User
  alias LuduExp.Repo

  def create_user(%{"password" => password} = params) do

    # Encrypt the password with Comeonin:
    encrypted_password = Comeonin.Bcrypt.hashpwsalt(password)

    # Create a user struct:
    register_changeset(params)
    |> put_change(:encrypted_password, encrypted_password)
    |> Repo.insert
  end

  def register_changeset(params \\ %{}) do
    User.changeset(params)
  end

end


#params = %{username: "ANOOP YASEEN", email: "anoop.yas@sf.com ", password: "1234"}

#LuduExp.Accounts.create_user(params)
