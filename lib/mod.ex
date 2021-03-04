defmodule Felix.Moderation do
  @moduledoc """
  this is the module for moderation and it contains the basic kick and ban commands
  """
  use Alchemy.Cogs
  alias Alchemy.User
  alias Alchemy.Client

  Cogs.def ban do
    Cogs.say "You cant ban no one, please specify and ID"
  end

  # Cogs.def ban(id) do

  # end

end
