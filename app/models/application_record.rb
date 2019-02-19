class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def to_param
    "#{id} #{to_s}".truncate(35, omission:'').parameterize
  end

end
