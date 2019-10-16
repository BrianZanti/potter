class SearchController < ApplicationController
  def index
    conn = Faraday.new(:url => 'https://www.potterapi.com/v1/') do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger do | logger |
        logger.filter(/(api_key=)(\w+)/,'\1[REMOVED]')
      end
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
    response = conn.get 'characters', {
      "house" => params[:house],
      "orderOfThePhoenix" => true,
      "key" => ENV["POTTER_API_KEY"]
    }
    json = JSON.parse(response.body, symbolize_names: true)
    @house_members = json.map do |hash|
      HouseMember.new(hash)
    end
    @result_count = @house_members.count
  end
end
