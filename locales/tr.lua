local Translations = {
    info = {
        kick_message = "Karakteriniz öldürüldü (Şimdi yeniden katılabilirsiniz!)",
        command_executed = "Karakter öldürüldü!",
        discord_success_notification = "Oyuncu ID'si: %s (Vatandaş ID'si: %s) için komut başarıyla gerçekleştirildi.", -- Discord için başarılı bildirim
        discord_error_notification = "Oyuncu ID'si: %s bulunamadı.", -- Discord için hata bildirimi
    },
    command = {
        info = "Oyuncunun karakterini öldür",
        playerid = "Oyuncu ID'si",
        player_not_found = "Oyuncu bulunamadı"
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})