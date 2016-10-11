module Services
  class ApiCaching

    USE_CACHE = true
    CACHING_TIME = 60 * 60 * 1 # 1 hour

    def self.get_data
      if USE_CACHE
        get_cached_data
      else
        do_request_and_filter_data
      end
    end

    def self.get_cached_data
      data = Caching.get(:champions_data)
      if data
        JSON.parse(data)
      else
        data = do_request_and_filter_data
        Caching.set(:champions_data, data, ex: CACHING_TIME)
        JSON.parse(data)
      end
    end

    def self.do_request_and_filter_data
      champions_data = Api.get_champions_data
      items_data = Api.get_items_data

      DataFiltering.new(champions_data, items_data).filter
    end

  end
end