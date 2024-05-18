class Admin < ApplicationRecord
  # 仮想属性 :login を追加
  attr_accessor :login
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["email = :value", { value: login }]).first
    elsif conditions.has_key?(:email)
      where(conditions.to_hash).first
    end
  end
end
