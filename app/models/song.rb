# == Schema Information
#
# Table name: songs
#
#  id          :integer          not null, primary key
#  artist_name :string
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Song < ApplicationRecord
  has_many  :favorites, class_name: "Favorite", foreign_key: "song_id", dependent: :destroy
  has_many :users, through: :favorites, source: :user
  validates :title, presence: true
end
