class User < ApplicationRecord
  has_secure_password()

  has_many :drill_groups, dependent: :nullify
  has_many :taken_questions, through: :transcripts, source: :question
  has_many :quest, through: :transcripts, source: :question
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates(
    :email,
    presence: true,
    uniqueness: true,
    format: VALID_EMAIL_REGEX
  )

  validates :first_name, :last_name, presence: true

  def full_name
    first_name + " " + last_name
  end

end
