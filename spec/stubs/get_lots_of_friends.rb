# encoding: UTF-8
module Stubs
  class GetLotsOfFriends < EndPointStub

    def initialize
      @friends_per_page = 500
      @pages = 50
      super
    end

    private

    def response(page_number)
      if page_number == @pages
        return "[]"
      end
      response_collection = Array.new
      @friends_per_page.times do 
        response_collection << friend_structure
      end

      JSON.generate(response_collection)
    end

    def with
      { "count" => @friends_per_page }
    end

    def friend_structure
      {
        :id	=> "4495458545",
        :name	=> "陳港生",
        :sex	=> "1",
        :headurl => "http://hdn.xnimg.cn/photos/hdn321/20120430/0850/h_head_5lSb_563e0006d3dc2f76.jpg",
        :headurl_with_logo => "http://hdn.xnimg.cn/photos/hdn321/20120430/0850/h_head_5lSb_563e0006d3dc2f76.jpg",
        :tinyurl_with_logo => "http://hdn.xnimg.cn/photos/hdn321/20120430/0850/h_head_5lSb_563e0006d3dc2f76.jpg"
      }
    end

    def request_body_with_page(page_number)
      request_params = { 
        "method"         => "friends.getFriends",
        "v"              => "1.0",
        "page"           => page_number.to_s,
        "count"          => @friends_per_page.to_s,
        "api_key"        => "api_key",
        "call_id"        => Time.now.to_i.to_s,
        "session_key"    => "session_key", 
        "format"         => "JSON"
      } 
      
      request_params[:sig] = Polar::SignatureCalculator.new("secret_key").calculate(request_params)
      request_params
    end
  end
end
