import Ecto.Query
alias Rumbl.User
alias Rumbl.Repo

# Qeury básico con condición
username = "josevalim"

# Repo.one regresa error si la consulta devuelve más de un resultado
jose = Repo.one(from u un User, where: u.username == ^username)

# Ecto sabe los tipos y levanta un error cuando
# ponemos mal los tipos de datos

Repo.all(from u in User, where: u.username == 123)
