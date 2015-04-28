require 'uri'
require 'dotenv'
require 'sinatra/activerecord'
Dotenv.load
# require 'pry'

db = URI.parse(ENV['DATABASE_URL'] || 'postgres://topik@localhost/topik_api')
# binding.pry
ActiveRecord::Base.establish_connection(
	:adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
	:host     => db.host,
	:username => db.user,
	:password => db.password,
	:database => db.path[1..-1],
	:encoding => 'utf8')