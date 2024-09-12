local QBCore = exports['qb-core']:GetCoreObject()

CreateThread(function()
    for _, alias in pairs(Config.command_alliases) do
        QBCore.Commands.Add(alias, Lang:t("command.info"), {{name = 'id', help = Lang:t("command.playerid")}}, true, function(source, args)
            local src = source
            local playerId = args[1]
            local Player = QBCore.Functions.GetPlayer(tonumber(playerId))
            if Player then
                local citizenid = Player.PlayerData.citizenid
                DropPlayer(playerId, Lang:t("info.kick_message"))
                CreateThread(function()
                    Wait(200)

                    exports.oxmysql:execute('DELETE FROM players WHERE citizenid = ?', { citizenid })
                    exports.oxmysql:execute('DELETE FROM player_vehicles WHERE citizenid = ?', { citizenid })
                    exports.oxmysql:execute('DELETE FROM player_outfits WHERE citizenid = ?', { citizenid })
                    exports.oxmysql:execute('DELETE FROM player_houses WHERE citizenid = ?', { citizenid })
                    exports.oxmysql:execute('DELETE FROM player_contacts WHERE citizenid =?', { citizenid })
                    exports.oxmysql:execute('DELETE FROM playerskins WHERE citizenid =?', { citizenid })

                    -- Discord'a bildirim gönder
                    local discordMessageSuccess = string.format(Lang:t("info.discord_success_notification"), playerId, citizenid)
                    PerformHttpRequest(Config.discord_webhook_url, function(err, text, headers) end, 'POST', json.encode({
                        content = discordMessageSuccess,
                        username = "Admin Bot"
                    }), { ['Content-Type'] = 'application/json' })

                    TriggerClientEvent("QBCore:Notify", src, Lang:t("info.command_executed"))
                    Config.finish_function(src, playerId)
                end)
            else
                -- Hata bildirimini Discord'a gönder
                local discordMessageError = string.format(Lang:t("info.discord_error_notification"), playerId)
                PerformHttpRequest(Config.discord_webhook_url, function(err, text, headers) end, 'POST', json.encode({
                    content = discordMessageError,
                    username = "Admin Bot"
                }), { ['Content-Type'] = 'application/json' })

                TriggerClientEvent('QBCore:Notify', src, Lang:t("command.player_not_found"), 'error')
            end
        end, 'admin')
    end
end)