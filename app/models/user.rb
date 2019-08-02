class User < ApplicationRecord
    has_many :photos
    has_many :albums
    has_many :comments
end
