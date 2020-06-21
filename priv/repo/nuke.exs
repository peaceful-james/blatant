# Script for deleting all data from the database. You can run it as:
#
#     mix run priv/repo/nuke.exs
#

import Ecto.Query
alias Blatant.Repo
alias Blatant.Accounts.Credential
alias Blatant.Accounts.User
alias Blatant.Content.Author
alias Blatant.Content.Post

from(p in Post)
|> Repo.delete_all()
from(a in Author)
|> Repo.delete_all()
from(s in Credential)
|> Repo.delete_all()
from(u in User)
|> Repo.delete_all()

