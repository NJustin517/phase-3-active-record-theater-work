class Role < ActiveRecord::Base
  has_many :auditions

  def actors
    self.auditions.map { |a| a.actor }
  end

  def locations
    self.auditions.map { |a| a.location }.uniq
  end

  def lead
    the_lead = self.auditions.select { |a| a.hired }
    !the_lead.empty? ? the_lead[0] : 'no actor has been hired for this role'
  end

  def understudy
    the_understudy = self.auditions.select { |a| a.hired }
    if the_understudy.length == 2
      the_understudy[1]
    else
      'no actor has been hired for this role'
    end
  end
end
