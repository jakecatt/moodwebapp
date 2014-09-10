class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  has_many :usermoods

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

#   def age(dob)
#   now = Time.now.utc.to_date
#   now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
# end

end
