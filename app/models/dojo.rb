class Dojo < ActiveRecord::Base
    validates :branch, :street, :state, :city, presence: true
    has_many :students

end
