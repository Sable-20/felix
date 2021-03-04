defmodule Felix do
  @moduledoc """
  this is the entry point
  """
  use Application
  alias Alchemy.Client
  use Alchemy.Cogs

  @token Application.fetch_env!(:felix, :token)

  @doc """
  check for Application
  """
  def start(_type, _args) do
    run = Client.start(@token)
    Cogs.set_prefix(">")
    load_modules()
    run
  end

  defp load_modules do
    use Felix.Basic
    use Felix.Stats
    use Felix.Docs
    use Felix.Events
    use Felix.Moderation
  end
end
