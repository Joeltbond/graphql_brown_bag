require 'graphql'

module Types
  Speaker = GraphQL::ObjectType.define do
    name 'Speaker'
    description 'Resembles a Speaker Object Type'

    field :id, !types.ID
    field :name, types.String
    field :talkTitle, types.String, property: :talk_title
  end
end
