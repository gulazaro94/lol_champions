require 'spec_helper'

describe Services::DataFiltering do

  it 'mush filter api data' do

      filtered_data = Services::DataFiltering.new(CHAMPIONS_TEST_DATA, ITEMS_TEST_DATA).filter

      expect(filtered_data).to eq(
        [{
          id: 266, key: 'Aatrox', name: 'Aatrox', title: 'a Espada Darkin',
          items_by_map:
            [{
              title: 'AatroxCS',
              map: 'CS',
              items_by_type: {
                'starting' => [
                  {id: 2009, name: "Biscoito do Rejuvenescimento Total"},
                  {id: 3089, name: 'Capuz da Morte de Rabadon'}
                ]
              }
            }]
        }].to_json
      )
  end

end