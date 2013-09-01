class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_many :workdays
  has_many :availability_statuses
  validates_length_of :password, :minimum => 3, :message => "password must be at least 3 characters long", :if => :password
  def is_admin?
    admin
  end
end
