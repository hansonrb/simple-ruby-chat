class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: [:user, :trainer, :admin]

  def name
    "#{first_name} #{last_name}"
  end

  def admin?
    role == 'admin'
  end
end
