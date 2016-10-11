module Services
  class ApiCaching

    USE_CACHE = true
    CACHING_TIME = 300 # 5 minutes

    def self.get_data
      if USE_CACHE
        get_cached_data
      else
        Api.get_champions_data
      end
    end

    def self.get_cached_data
      data = ::Services::Caching.get(:champions_data)
      if !data
        data = Api.get_champions_data
        Caching.set(:champions_data, data, ex: CACHING_TIME)
      end
      return JSON.parse(data)
    end

  end
end