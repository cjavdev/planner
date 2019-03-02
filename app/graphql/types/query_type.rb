module Types
  class QueryType < Types::BaseObject
    field :schools, [SchoolType], null: true do
      description "get all schools"
      argument :min_gs_rating, Int, default_value: 0, required: false
      argument :elementary, Boolean, required: false
    end

    def schools(min_gs_rating:, elementary:)
      School.where(<<~SQL, gs_rating: min_gs_rating, elementary: elementary)
          gs_rating >= :gs_rating
        AND
          (:elementary is null or elementary = :elementary)
      SQL
    end

    field :companies, [CompanyType], null: true do
      description "get all companies"
    end

    def companies
      Company.all
    end

    field :homies, [HomieType], null: true do
      description "call the homies"
    end

    def homies
      Homie.all
    end
  end
end
