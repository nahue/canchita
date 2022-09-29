# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Saas101.Repo.insert!(%Saas101.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Saas101.Repo
alias Saas101.Users.User
alias Saas101.Settings.Venue

Triplex.create("canchita")

Repo.insert!(
  %User{
    email: "test@test.com",
    password_hash:
      "$pbkdf2-sha512$100000$fmyL2D4eBe6psZkQkaVsTw==$1X//1sv7wjwgdfHaQM7EEey5nL5tbCRCji4LD2IVi1Stg0zUajxLtAUQDTUvPB/x9X5QGHy9ODxqqdjdyK9Lvw=="
  },
  prefix: Triplex.to_prefix("canchita")
)

Repo.insert!(
  %Venue{
    name: "Local A"
  },
  prefix: Triplex.to_prefix("canchita")
)
