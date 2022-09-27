defmodule Saas101.Accounts do
  alias Ecto.Changeset
  alias Saas101.{Repo, Users.User}

  @otp_app :saas101
  @tenant_param :tenant

  def create_account(tenant_id, params) do
    tenant_id
    |> Triplex.create_schema(Repo, fn tenant, repo ->
      do_create_account(tenant, repo, params)
    end)
    |> case do
      {:ok, tenant} -> {:ok, Repo.one!(User, prefix: tenant)}
      {:error, %Changeset{} = changeset} -> {:error, changeset}
      {:error, reason} -> invalid_tenant_changeset_error(params, "couldn't be created", reason)
    end
  end

  defp do_create_account(tenant, repo, params) do
    pow_config = [
      otp_app: @otp_app,
      repo: repo,
      user: User,
      repo_opts: [prefix: tenant]
    ]

    Ecto.Multi.new()
    |> Ecto.Multi.run(:triplex_migration, fn repo, %{} ->
      Triplex.migrate(tenant, repo)
    end)
    |> Ecto.Multi.run(:user, fn _, _ ->
      Pow.Ecto.Context.create(params, pow_config)
    end)
    |> repo.transaction()
    |> case do
      {:ok, any} ->
        {:ok, any}

      {:error, :triplex_migration, reason, _} ->
        invalid_tenant_changeset_error(params, "couldn't be created", reason: reason)

      {:error, :user, changeset, _} ->
        {:error, changeset}
    end
  end

  defp invalid_tenant_changeset_error(params, error, keys) do
    changeset =
      %User{}
      |> User.changeset(params)
      |> Changeset.add_error(@tenant_param, error, keys)

    {:error, changeset}
  end
end
