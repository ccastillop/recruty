class User < ApplicationRecord

  def admin?
    level == 'admin'
  end

  def normal?
    level == 'normal'
  end

  def current_user
    name
  end

end
