require 'rails_helper'

RSpec.describe Match do
  let(:match) { FactoryGirl.create :match }

  it "displays the date in a human-like output" do
    date = DateTime.new(2014, 5, 6, 12, 30)
    match.created_at = date
    expect(match.beautified_created_at).to eq("6.5.2014 a les 12:30h pm")
  end

  it "resets the duration and all the scores" do
    3.times do |index|
      match.scores << Score.create(points: 24, player_id: index)
    end
    match.reset_scores_and_duration
    expect(match.duration).to eq(0)
    match.scores.each do |score|
      expect(score.points).to eq(0)
    end
  end

  it "answers with the truth when asked if closed" do
    match.open_status = true
    expect(match.closed?).to eq(false)
  end

  context "scopes" do
    it "shows only the opened (ongoing) matches when .opened is aplied" do
      closed_match = FactoryGirl.create :match, open_status: false
      expect(Match.opened).to eq([match])
    end

    it "shows only the closed matches when .closed is aplied" do
      closed_match = FactoryGirl.create :match, open_status: false
      expect(Match.closed).to eq([closed_match])
    end

    context "the .ordered one" do
      it "shows the opened matches before the closed ones" do
        closed_match = FactoryGirl.create :match, open_status: false
        expect(Match.ordered).to eq([match, closed_match])
      end

      it "shows the newest matches first" do
        opened_match = FactoryGirl.create :match, created_at: DateTime.now - 1.month
        another_opened_match = FactoryGirl.create :match, created_at: DateTime.now - 2.month
        expect(Match.ordered).to eq([opened_match, another_opened_match])
      end
    end
  end
end