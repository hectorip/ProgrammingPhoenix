defmodule Rumbl.User do
  """
  User model
  """
  use Rumbl.Web, :model

  schema "users" do
    field :name, :string
    field :email, :string
    field :username, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    timestamps
  end

  def changeset(model, params \\ :empty) do
    model
      |> cast(params, ~w(name username), [])
      |> validate_length(:username, min: 1, max: 20)
  end

  def registration_changeset(model, params) do
    model
      |> changeset(params)
      |> cast(params, ~(password), [])
      |> validate_length(:password, min: 6, max: 100)
      |> put_hashed_pass()
  end

  # def put_hashed_pass(change)
end