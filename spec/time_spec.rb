RSpec.describe Tools::Time do
  it "can calculate hours, minutes and seconds" do
    time = Tools::Time.new("01:00:00", 1, 30, 10)
    expect(time.adjust_time).to eq("02:30:10")
  end

  it "can transform seconds into minutes and minutes into hours" do
    time = Tools::Time.new("18:22:30", 4, 60, 30)
    expect(time.adjust_time).to eq("23:23:00")
  end

  it "starts calculating the time from the beginning, if there are more than 24 hours given" do
    time = Tools::Time.new("00:00:00", 72, 120, 120)
    expect(time.adjust_time).to eq("02:02:00")
  end
end