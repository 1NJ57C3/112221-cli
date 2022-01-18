class Character < ActiveRecord::Base
  has_many :equipment
  belongs_to :user
end