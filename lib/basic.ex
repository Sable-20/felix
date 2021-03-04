defmodule Felix.Basic do
  alias Alchemy.Guild
  use Alchemy.Cogs
  alias Alchemy.{Client, Cache, User, Embed}
  import Embed
  alias Felix.Util.Time
  alias Alchemy.User


  @doc """
  The classic ping command, including the latency.
  """
  Cogs.def ping do
    # message is an implicit parameter to commands
    old = message.timestamp
    {:ok, message} = Task.await Cogs.say("pong!")
    time = Time.diff(message.timestamp, old)
    Client.edit_message(message, message.content <> "\ntook #{time} ms")
  end


  defp days_ago(then) do
    now = NaiveDateTime.utc_now()
    div(Time.diff(now, then, :second), 86400)
  end

  @blue_embed %Embed{color: 0x1f95c1}

  Cogs.def userinfo(user) do
    %Embed{color: 0x1f95c1}
    # |> author(name: user.name)
    |> thumbnail(User.avatar_url(user))
    |> field("Username:", "#{user}", inline: true)
    |> field("Member for:", "#{days_ago(user.joined_at)} days", inline: true)
    |> Embed.send()
  end

  # def userinfo_embed(guild, member) do
  #   role_names =
  #     guild.roles
  #     |> Stream.filter_map(& &1.id in member.roles, & &1.name)
  #     |> Enum.sort_by(&String.downcase/1)
  #     |> Enum.join(", ")
  #   user = member.user
  #   @blue_embed
  #   |> author(name: "ur mom",
  #               url: "https://discord.com/developers",
  #               icon_url: member.icon_url)
  #   |> thumbnail(User.avatar_url(user))
  #   |> field("Username:", "#{user}", inline: true)
  #   |> field("Member for:", "#{days_ago(member.joined_at)} days", inline: true)
  #   |> field("Roles:", "#{role_names}")
  # end



  # Cogs.def userinfo(id) do
  #   with {:ok, guild} <- Cogs.guild(),
  #       {:ok, member} <- Cache.member(guild.id, id)
  #   do
  #     userinfo_embed(guild, member)
  #     |> Cogs.send()
  #   else
  #     _ -> Cogs.say "Failed to find member `#{id}` in this guild."
  #   end
  # end

  # Cogs.def userinfo do
  #   {:ok, guild} = Cogs.guild()
  #   {:ok, member} = Cogs.member()
  #   userinfo_embed(guild, member)
  #   |> Embed.send
  # end
end
