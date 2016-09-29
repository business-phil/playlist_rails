class Song < ActiveRecord::Base
    has_many :selections, dependent: :destroy
    has_many :users, through: :selections
    validates :artist, :title, presence:true, length:{ minimum:2 }
end
