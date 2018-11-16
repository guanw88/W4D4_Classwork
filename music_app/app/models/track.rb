# == Schema Information
#
# Table name: tracks
#
#  id            :bigint(8)        not null, primary key
#  title         :string           not null
#  ord           :integer          not null
#  lyrics        :text
#  regular_track :boolean          default(TRUE), not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  album_id      :integer          not null
#

class Track < ApplicationRecord
  validates :title, :ord, presence: true
  validates :regular_track, :inclusion => {:in => [true, false]}

  belongs_to :album,
    primary_key: :id,
    foreign_key: :album_id,
    class_name: :Album

  has_many :notes,
    primary_key: :id,
    foreign_key: :track_id,
    class_name: :Note

  def track_type
    regular_track ? "Regular" : "Bonus"
  end
end
