require 'spec_helper'

describe Services::Api do

  it '.get_champions_data' do
    data = Services::Api.get_champions_data

    expect(JSON.parse(data)).to eq({'success' => true})
  end

end