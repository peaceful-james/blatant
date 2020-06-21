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
alias Blatant.Accounts.Credential
alias Blatant.Accounts.User
alias Blatant.Content.Author
alias Blatant.Content.Post

user = %User{name: "Peaceful James", username: "peaceful-james"}
|> Repo.insert!

%Credential{email: "james@peacefulprogramming.xyz", user_id: user.id}
|> Repo.insert!

author = %Author{bio: "Journeyman developer who values dignity, autonomy and humility.", user_id: user.id}
|> Repo.insert!

%Post{
  title: "My reckon",
  body: "Be peaceful and bang out some code.",
  author_id: author.id,
  published_at: NaiveDateTime.utc_now() |> NaiveDateTime.truncate(:second)
} |> Repo.insert!
