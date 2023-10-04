defmodule DiscordWebhookApp do
  @webhook_url System.get_env("DISCORD_WEBHOOK_URL")

  def send_message(content) when is_binary(content) and byte_size(content) > 0 do
    body = Poison.encode!(%{"content" => content})

    headers = [
      {"Content-Type", "application/json"}
    ]

    case HTTPoison.post(@webhook_url, body, headers) do
      {:ok, %HTTPoison.Response{status_code: 204}} ->
        IO.puts("Message sent successfully!")

      {:ok, %HTTPoison.Response{status_code: status_code, body: body}} ->
        IO.puts("Error sending message. Status: #{status_code}")
        IO.puts("Response: #{body}")

      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.puts("HTTP error: #{reason}")
    end
  end
end
