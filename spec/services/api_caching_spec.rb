require 'spec_helper'

describe Services::ApiCaching do

  context 'getting data first time without caching' do
    it '.get_data' do
      expect(Services::Api).to receive(:get_champions_data).and_return({success: true}.to_json)
      expect(Services::ApiCaching.get_data).to eq({'success' => true})
    end
  end

  context 'gettin cached data' do
    it '.get_data' do
      Services::ApiCaching.get_data

      expect(Services::Api).to_not receive(:get_champions_data)

      expect(Services::ApiCaching.get_data).to eq({'success' => true})
    end
  end
end