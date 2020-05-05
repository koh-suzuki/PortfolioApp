class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_one :profile, dependent: :destroy
  has_many :articles, dependent: :destroy
  has_many :healths, dependent: :destroy
  
  delegate :name, to: :profile
  
  # healthsの中から各weight情報を取り出す
  # 主にグラフに使います。
  def self.weight
    @healths.each do |health|
      @weight = health.weight
    end
  end
end
