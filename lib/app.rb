require 'fileutils'
require 'active_record'
require 'active_support/all'
require 'rack/parser'
require 'sinatra'
require 'sinatra/json'
require 'sqlite3'

require 'rgb'
require 'rgba'
require 'rgb_a_utils'
require 'rgb_string'
require 'rgb_value_parser'
require 'string_validator'
require 'string_validator_api'

DATABASE_FILE = '/tmp/rgb_content.sqlite3'
FileUtils.rm(DATABASE_FILE) if File.exist?(DATABASE_FILE)

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => DATABASE_FILE
)

ActiveRecord::Schema.define do
  create_table :rgb_strings do |t|
    t.string :input_string
    t.string :response
  end
end
