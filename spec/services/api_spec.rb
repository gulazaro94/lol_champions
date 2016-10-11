require 'spec_helper'

describe Services::Api do

  it '.get_champions_data' do
    data = Services::Api.get_champions_data

    expect(data).to eq(CHAMPIONS_TEST_DATA)
  end

end