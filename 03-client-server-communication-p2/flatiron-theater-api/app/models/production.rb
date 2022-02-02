class Production < ApplicationRecord
    has_many :production_roles
    has_many :tickets
    has_many :users, through: :tickets

    validates :name, presence: true, uniqueness: true
    validates :budget, numericality: { other_than: 0 }

end
