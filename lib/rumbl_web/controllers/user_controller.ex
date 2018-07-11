defmodule RumblWeb.UserController do
    use RumblWeb, :controller

    def index(conn, _params) do
        users = Rumbl.Repo.all(Rumbl.User)
        render conn, "index.html", users: users
    end
        
    def show(conn, %{"id" => id}) do
        user = Rumbl.Repo.get(Rumbl.User, id)
        render conn, "show.html", user: user
    end
    
    alias Rumbl.User
    def new(conn, _params) do
        changeset = User.changeset(%User{})
        render conn, "new.html", changeset: changeset
    end

    # def create(conn, %{"user" => user_params}) do
    #     changeset = User.changeset(%User{}, user_params)
    #     {:ok, user} = Repo.insert(changeset)
    #     conn
    #     |> put_flash(:info, "#{user.name} created!")
    #     |> redirect(to: user_path(conn, :index))
    # end

    alias Rumbl.Repo
    def create(conn, %{"user" => user_params}) do
        changeset = User.changeset(%User{}, user_params)
        case Repo.insert(changeset) do
            {:ok, user} ->
                conn
                |> put_flash(:info, "#{user.name} created!")
                |> redirect(to: user_path(conn, :index))
            {:error, changeset} ->
                render(conn, "new.html", changeset: changeset)
        end
    end
        
end