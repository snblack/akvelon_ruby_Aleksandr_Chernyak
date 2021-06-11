class Doc < ApplicationRecord
  belongs_to :listing

  validates :name, :size, :update_time, :type_doc,  presence: true
end
