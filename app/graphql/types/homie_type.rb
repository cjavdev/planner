module Types
  class HomieType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :lat, Float, null: false
    field :lng, Float, null: false
  end
end
