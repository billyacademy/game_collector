require "rails_helper"

feature "views list of  Board Games", %q(
  As a Visitor of th eGame Collector website
  I want to see a list of board games
  So that I can learn about awesome games.

  Acceptance Criteria

  [ ] If I naviage to the /board_games path, I should see a list of games
) do

  scenario "views list of board games" do
    games = []
    3.times do |x|
      attrs = {
      name: "Jenga #{x}",
      publisher: "Hasbro",
      description: "Best game involving a tower of blocks ever xxxxxxxxxxxxxxx",
      release_date: 2.weeks.ago
    }

    games << BoardGame.create(attrs)
  end

    visit board_games_path

    games.each do |game|
    expect(page).to have_content game.name
    end
  end
end
