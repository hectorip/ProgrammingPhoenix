import Ecto.Query
alias Rumbl.User
alias Rumbl.Repo

# Qeury básico con condición
username = "josevalim"
jose = Repo.one(from u un User, where: u.username == ^username)
