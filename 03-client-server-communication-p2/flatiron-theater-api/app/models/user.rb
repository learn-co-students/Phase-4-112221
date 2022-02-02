class User < ApplicationRecord
    has_many :tickets, dependent: :destroy
    has_many :productions, through: :tickets
    
    validates :name, presence: true, uniqueness: true
    validates :email, format: /\w+@\w+\.{1}[a-zA-Z]{2,}/, presence: true, uniqueness: true
end
