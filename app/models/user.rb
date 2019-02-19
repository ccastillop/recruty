class User < ApplicationRecord

  def admin?
    level == 'admin'
  end

  def normal?
    level == 'normal'
  end

  def to_s
    name
  end

end
