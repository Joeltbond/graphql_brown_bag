require 'graphql'
require_relative 'query'

BrownBagAppSchema = GraphQL::Schema.define do
  query Query
end
