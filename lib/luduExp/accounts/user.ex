defmodule LuduExp.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias LuduExp.Accounts.User


  schema "users" do
    field :email, :string, unique: true
    field :encrypted_password, :string
    field :username, :string, unique: true
    field :password, :string, virtual: true

    timestamps()
  end

  @doc false
  def changeset(attrs \\ %{}) do
    %User{}
    |> cast(attrs, [:username, :email, :password])
    |> validate_required([:username, :email, :password])
    |> unique_constraint(:email)
    |> unique_constraint(:username)
    |> validate_format(:email, ~r/@/)
    |> validate_format(:username, ~r/^[a-zA-Z0-9]*$/)
    |> validate_length(:password, min: 4)
  end
end
