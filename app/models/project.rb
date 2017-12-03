class Project < ApplicationRecord
  has_many :sites, dependent: :delete_all
end
