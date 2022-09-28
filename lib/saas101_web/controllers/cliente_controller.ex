defmodule Saas101Web.ClienteController do
  use Saas101Web, :controller

  alias Saas101.Clientes
  alias Saas101.Clientes.Cliente

  def index(conn, _params) do
    clientes = Clientes.list_clientes(conn.assigns[:current_tenant])
    render(conn, "index.html", clientes: clientes)
  end

  def new(conn, _params) do
    changeset = Clientes.change_cliente(%Cliente{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"cliente" => cliente_params}) do
    case Clientes.create_cliente(cliente_params, conn.assigns[:current_tenant]) do
      {:ok, cliente} ->
        conn
        |> put_flash(:info, "Cliente created successfully.")
        |> redirect(to: Routes.cliente_path(conn, :show, cliente))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    cliente = Clientes.get_cliente!(id, conn.assigns[:current_tenant])
    render(conn, "show.html", cliente: cliente)
  end

  def edit(conn, %{"id" => id}) do
    cliente = Clientes.get_cliente!(id, conn.assigns[:current_tenant])
    changeset = Clientes.change_cliente(cliente)
    render(conn, "edit.html", cliente: cliente, changeset: changeset)
  end

  def update(conn, %{"id" => id, "cliente" => cliente_params}) do
    cliente = Clientes.get_cliente!(id, conn.assigns[:current_tenant])

    case Clientes.update_cliente(cliente, cliente_params) do
      {:ok, cliente} ->
        conn
        |> put_flash(:info, "Cliente updated successfully.")
        |> redirect(to: Routes.cliente_path(conn, :show, cliente))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", cliente: cliente, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    cliente = Clientes.get_cliente!(id, conn.assigns[:current_tenant])
    {:ok, _cliente} = Clientes.delete_cliente(cliente)

    conn
    |> put_flash(:info, "Cliente deleted successfully.")
    |> redirect(to: Routes.cliente_path(conn, :index))
  end
end
