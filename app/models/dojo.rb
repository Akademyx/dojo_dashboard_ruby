class Dojo < ActiveRecord::Base
    validates :branch, :street, :state, :city, presence: true
end
