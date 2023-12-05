# == Schema Information
#
# Table name: favorites
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  song_id    :integer
#  user_id    :integer
#
class Favorite < ApplicationRecord
  belongs_to :song, required: true, class_name: "Song", foreign_key: "song_id"
  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id", counter_cache: true
end
