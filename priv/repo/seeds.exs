# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Blatant.Repo.insert!(%Blatant.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Blatant.Repo
alias Blatant.Accounts.User
alias Blatant.Content.Post

user = %User{name: "Peaceful James", username: "peaceful-james"}
|> Repo.insert!([email: "james@peacefulprogramming.xyz"])

post = %Post{title: "My reckon", body: "Be peaceful and bang out some code.", user_id: user.id}
|> Repo.insert!
