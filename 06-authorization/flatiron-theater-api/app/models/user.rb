class User < ApplicationRecord
    has_secure_password
    has_many :tickets
    has_many :productions, through: :tickets
    
    validates :name, presence: true, uniqueness: true
    validates :email, format: /\w+@\w+\.{1}[a-zA-Z]{2,}/, presence: true, uniqueness: true
    validate :permited_emails

    def permited_emails
        unless  email.match?(/gmail.com|yahoo.com|icloud.com/)
            errors.add(:permited_emails, "I'm sorry that email is not permited")
        end
    end 
end
