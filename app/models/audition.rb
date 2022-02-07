class Audition < ActiveRecord::Base
  belongs_to :role

  def call_back
    self.hired = 1
    self.save
  end
end
