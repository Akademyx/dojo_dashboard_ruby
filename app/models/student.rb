class Student < ActiveRecord::Base
  belongs_to :dojo
  validates :first_name, :last_name, :email, presence: true

  private
  def self.query
    Student.joins(:dojo).where.not(id: student.id).where(dojo: dojo).where(created_at: students_date.midnight..students_date.end_of_day).select(:first_name,:last_name,:email)
  end
end
