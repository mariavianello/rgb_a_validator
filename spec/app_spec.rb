RSpec.describe 'app setup' do
  it 'has a working database connection' do
    tables = ActiveRecord::Base.connection.tables
    expect(tables).to include('rgb_strings')
  end
end
