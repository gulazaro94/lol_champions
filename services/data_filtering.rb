module Services
  class DataFiltering

    def initialize(champions_data, items_data)
      @champions_data = champions_data
      @items_data = items_data
    end

    def filter
      @champions_data['data'].map do |champion_key, champion_data|
        {id: champion_data['id'], key: champion_key, name: champion_data['name'], title: champion_data['title'], items_by_map: items_by_map(champion_data['recommended'])}
      end.sort_by { |data| data[:name] }.to_json
    end

    private


    def items_by_map(recommended_node)
      recommended_node.map do |data|
        {title: data['title'], map: data['map'], items_by_type: items_by_type(data['blocks'])}
      end
    end

    def items_by_type(blocks_node)
      items = {}
      blocks_node.each do |data|
        items[data['type']] = data['items'].map { |item_data| {id: item_data['id'], name: item_name_by_id(item_data['id'])} }
      end
      items
    end


    def item_name_by_id(item_id)
      @items_data['data'][item_id.to_s]&.send(:[], 'name')
    end
  end
end