# == Schema Information
#
# Table name: schools
#
#  id                   :bigint(8)        not null, primary key
#  region_id            :integer
#  students_per_teacher :string
#  grades               :string
#  size                 :string
#  name                 :string
#  lat                  :string
#  lng                  :string
#  gs_rating            :integer
#  school_type          :string
#  gs_school_id         :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class School < ApplicationRecord
end
