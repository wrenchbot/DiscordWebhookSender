defmodule DiscordWebhookApp.Application do
  use Application

  def start(_type, _args) do
    {:ok, _} = :application.ensure_all_started(:hackney)

    IO.puts("Enter your message:")
    message = IO.gets("")
    DiscordWebhookApp.send_message(message)

    :init.stop()
  end
end
