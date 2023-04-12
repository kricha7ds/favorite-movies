require "json"
require "net/http"
require "uri"

module TMDB
  BASE_URL = "https://api.themoviedb.org/3"

  cattr_accessor :api_key

  def self.client
    @client ||= ApiClient.new(api_key: self.api_key)
  end

  def self.config
    @config ||= client.get_configuration["body"]
  end

  # This is a minimal TMDB API client, you can extend it as needed.
  # https://www.themoviedb.org/documentation/api
  # https://developers.themoviedb.org/3/getting-started/introduction
  class ApiClient
    def initialize(api_key: nil)
      @api_key = api_key
    end

    def get_configuration
      get("/configuration")
    end

    def get_movie(id)
      get("/movie/#{id}")
    end

    def get(path, query = nil)
      url = build_url(path, query)
      request = Net::HTTP::Get.new(url.to_s)

      http_request(request)
    end

    def search_movies(query)
      req_params = {
        query: query
      }

      response = get("/search/movie", req_params)
      results = response.dig(:body, :results)
    end

    def post(url, body = nil)
      url = build_url(path)
      request = Net::HTTP::Post.new(url)
      request.body = URI.encode_www_form(body) if body

      http_request(request)
    end

    private def build_url(path, query = nil)
      url = URI.parse(TMDB::BASE_URL)

      query = { api_key: @api_key }.merge(query.to_h)
      url.query = URI.encode_www_form(query)
      url.path = File.join(url.path, path)

      url
    end

    private def http_request(request)
      uri = URI.parse(request.path)
      response = Net::HTTP.start(uri.host, uri.port, use_ssl: true) { |http|
        http.request(request)
      }

      parsed_body = JSON.parse(response.body) rescue nil

      {
        "body" => parsed_body,
        "headers" => response.to_hash,
        "status" => response.code,
      }.with_indifferent_access
    end
  end
end
