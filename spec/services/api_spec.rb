require 'spec_helper'
require_relative '../../services/api'

describe Services::Api do

  before do
    stub_request(:get, Services::Api::URL).
     to_return(status: 200, body: '{"success": true}')

  end

  it '#get_data' do
    data = Services::Api.new.get_data

    expect(data).to eq({'success' => true})
  end

end