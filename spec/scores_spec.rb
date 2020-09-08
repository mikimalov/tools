RSpec.describe Tools::Scores do
  it 'lists all of the scores' do
    scores = Tools::Scores.new([20,60,80,100])
    expect(scores.scores).to eq [20,60,80,100]
  end

  it 'lists the last score of the list' do
    scores = Tools::Scores.new([20,60,80,100])
    expect(scores.latest).to eq 100
  end

  it 'can show the personal best score' do
    scores = Tools::Scores.new([20,125,75,100])
    expect(scores.personal_best).to eq 125
  end

  it 'can show first three best scores' do
    scores = Tools::Scores.new([95, 10, 30, 90, 30, 100, 40, 40, 70, 70])
    expect(scores.best_three).to eq [100,95,90]
  end

  it 'can show three best scores from hihgest to lowest' do
    scores = Tools::Scores.new([30, 90, 100])
    expect(scores.best_three).to eq [100,90,30]
  end

  it 'can show three best scores even there is a tie' do
    scores = Tools::Scores.new([0, 20, 30, 30, 100])
    expect(scores.best_three).to eq [100,30,30]
  end

  it 'can show all best scores even there is less than three' do
    scores = Tools::Scores.new([0, 20])
    expect(scores.best_three).to eq [20, 0]
  end

  it 'can show scores even there is only one' do
    scores = Tools::Scores.new([40])
    expect(scores.best_three).to eq [40]
  end

  it 'calculates if latest is the personal best score' do
    scores = Tools::Scores.new([95, 10, 30, 90, 30, 100, 40, 40, 70, 70])
    expect(scores.latest_is_personal_best?).to eq false
  end

  it 'calculates if latest is the personal best score' do
    scores = Tools::Scores.new([95, 10, 30, 90, 30, 100, 40, 40, 70, 100])
    expect(scores.latest_is_personal_best?).to eq true
  end
end