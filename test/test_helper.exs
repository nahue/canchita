ExUnit.start()
Triplex.create("tenant_a")
Triplex.create("tenant_b")
Ecto.Adapters.SQL.Sandbox.mode(Saas101.Repo, :manual)
