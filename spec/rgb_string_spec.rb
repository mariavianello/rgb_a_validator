RSpec.describe RgbString do
  it 'can create and find' do
    created_rgb_string = RgbString.create!(:input_string => 'rgba(0,0,0,0)')
    found_rgb_string = RgbString.find_by(:input_string => 'rgba(0,0,0,0)')
    expect(found_rgb_string).to eq(created_rgb_string)
  end
end
