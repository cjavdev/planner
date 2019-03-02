module Types
  class SchoolType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :students_per_teacher, String, null: false
    field :grades, String, null: false
    field :size, Int, null: false
    field :lat, Float, null: false
    field :lng, Float, null: false
    field :school_type, String, null: false
    field :gs_rating, Int, null: true
    field :levels, String, null: true
    field :elementary, Boolean, null: true
  end
end
