defmodule PumpkinAssignmentElixirWeb.ChangesetView do
  use PumpkinAssignmentElixirWeb, :view

  def translate_errors(changeset) do
    Ecto.Changeset.traverse_errors(changeset, &translate_error/1)
  end

  def render("error.json", %{changeset: changeset}) do
    %{message: process_errors(translate_errors(changeset))}
  end

  defp process_errors(errors) do
    Enum.map(errors, fn {_, list} -> Enum.join(list, ", ") end) |> Enum.join(", ")
  end
end
