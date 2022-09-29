defmodule Saas101Web.TurnoView do
  use Saas101Web, :view

  defp today do
    Timex.local
  end
end
