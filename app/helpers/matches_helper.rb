module MatchesHelper
  def display_opened_or_closed
    (params[:tab] == "closed") ? "tancades" : "en disputa"
  end

  def display_duration_or_opened match
    (match.duration == 0) ? "en disputa" : "#{match.duration} min"
  end

  def display_players_for match
    all_players = ""
    match.players.each do |player|
      all_players += "#{ link_to player.name, player_path(player.id) } "
    end
    all_players.html_safe
  end

  def link_to_reopen_or_close match
    match.open_status ? link_to("Tanca-la", "/match/#{match.id}/close") : link_to("Reobre-la", "/match/#{match.id}/reopen")
  end
end
