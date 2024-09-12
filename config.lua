Config = {
    -- Command alliases
    command_alliases = {
        "ck",
        "characterkill",
    },

    -- Discord bot token (isteğe bağlı)
    discord_bot_token = "YOUR_DISCORD_BOT_TOKEN", -- Gerekirse Discord bot tokeninizi buraya ekleyin.

    -- Discord channel ID (isteğe bağlı)
    discord_channel_id = "YOUR_DISCORD_CHANNEL_ID", -- Gerekirse Discord kanal ID'sini buraya ekleyin.

    -- Discord webhook URL
    discord_webhook_url = "YOUR_DISCORD_WEBHOOK_URL", -- Discord webhook URL'sini buraya ekleyin.

    -- Function that runs after successful command execution
    finish_function = function(idOfPlayerOfWhoRanCmd, targetId)
        -- Do something here
    end
}