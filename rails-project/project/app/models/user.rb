class User < ApplicationRecord

  validates :name, presence: true ,length: { maximum: 25}
  validates :gender, presence: true
  validates :password, presence: true ,length: { in: 6..20 }
  validates :email, uniqueness: true, on: :account_setup,presence: true ,confirmation: { case_sensitive: false }

has_many :courses
has_and_belongs_to_many :lectures
# has_and_belongs_to_many :lectures
mount_uploader :profilepicture
end
