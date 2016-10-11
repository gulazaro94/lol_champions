require 'spec_helper'

describe Services::ApiCaching do

  context 'getting data first time without caching' do
    it '.get_data' do
      expect(Services::Api).to receive(:get_champions_data).and_return(CHAMPIONS_TEST_DATA)
      expect(Services::Api).to receive(:get_items_data).and_return(ITEMS_TEST_DATA)

      filterd_data = Services::DataFiltering.new(CHAMPIONS_TEST_DATA, ITEMS_TEST_DATA).filter

      expect(Services::ApiCaching.get_data).to eq(JSON.parse(filterd_data))
    end
  end

  context 'gettin cached data' do
    it '.get_data' do
      Services::ApiCaching.get_data

      expect(Services::Api).to_not receive(:get_champions_data)

      filterd_data = Services::DataFiltering.new(CHAMPIONS_TEST_DATA, ITEMS_TEST_DATA).filter

      expect(Services::ApiCaching.get_data).to eq(JSON.parse(filterd_data))
    end
  end
end