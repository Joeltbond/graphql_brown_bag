require 'graphql'
require_relative 'types/speaker_type'

Query = GraphQL::ObjectType.define do
  name 'Query'
  description 'The query root of this schema'

  field :speakers, types[Types::Speaker] do
    description 'Get a list of speakers'
    resolve ->(_obj, _args, _ctx) { Speaker.all }
  end

  field :speaker, Types::Speaker do
    description 'Get a speaker by id'
    argument :id, !types.ID
    resolve ->(_obj, args, _ctx) { Speaker.find(args[:id]) }
  end
end
