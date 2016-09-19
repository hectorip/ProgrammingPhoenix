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


# Queries con syntaxis de Keyword map

Repo.one from u in User,
         select: count(u.id),
         where: ilike(u.username, ^"%j") or
                ilike(u.username, ^"c%")

# Queries con sintaxis de pipe

User |>
  select([u], count(u.id)) |>
  where([u], ilike(u.username, ^"j%") or ilike(u.username, ^"c%")) |>
  Repo.one()

# fragments

query = from(u in User,
  where: fragment("lowe(username) = ?",
                  ^String.downcase(uname)))

# Raw Queries

query = Ecto.Adapters.SQL.query(Rumbl.Repo, "SELECT power($1, $2)", [2, 10])

# Loading relationships
user = Repo.one(from u in User, limit: 1)
user_with_videos = Repo.preload(user, :videos)