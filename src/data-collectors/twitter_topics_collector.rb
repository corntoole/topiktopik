require 'dotenv'
Dotenv.load
require 'rest_client'

require 'active_record'
require 'oauth'
require 'json'

require 'pg'


require 'pry'

require '../environments'


baseurl     = "https://api.twitter.com"
trends_path = "/1.1/trends/place.json"
trends_url  = "#{baseurl}#{trends_path}"


consumer_key = OAuth::Consumer.new( 
	ENV['TWITTER_CONSUMER_KEY'],
	ENV['TWITTER_CONSUMER_SECRET'],
	 )
access_token = OAuth::Token.new(
	ENV['TWITTER_ACCESS_TOKEN'],
	ENV['TWITTER_ACCESS_TOKEN_SECRET'])


query            = URI.encode_www_form("id" => "1", "exclude" => "hashtags")
address          = URI("#{trends_url}?#{query}")
http             = Net::HTTP.new address.host, address.port
http.use_ssl     = true
http.verify_mode = OpenSSL::SSL::VERIFY_PEER

RestClient.add_before_execution_proc do |req, params|
	req.oauth! http, consumer_key, access_token
end 

trends_resource = RestClient::Resource.new(
	"#{trends_url}?#{query}",
	:params => {:id => 1},
	:use_ssl => true,
	:verify_ssl => OpenSSL::SSL::VERIFY_PEER) 
trends_resource.get { |response, request, result, &block|
		puts response.code
		case response.code
		when 200
			pp JSON.parse(response.body)
		else
			response.return!(request, result, &block)
		end
	}

