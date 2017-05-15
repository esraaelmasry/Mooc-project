class Lecture < ApplicationRecord

  validates :content, presence: true ,length: { minimum: 3 }
  validates :course , presence: true
  validates :attatchment, presence: true

  belongs_to :course
  has_many :comments
  has_and_belongs_to_many :users
   # has_and_belongs_to_many :users
  acts_as_votable
  # mount_uploader :attatchment
mount_uploader :attatchment, AttachmentUploader
end
