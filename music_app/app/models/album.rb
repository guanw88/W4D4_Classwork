# == Schema Information
#
# Table name: albums
#
#  id         :bigint(8)        not null, primary key
#  title      :string           not null
#  year       :integer          not null
#  band_id    :integer          not null
#  live_album :boolean          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Album < ApplicationRecord
  validates :title, :year, :band_id, presence: true
  validates :live_album, :inclusion => {:in => [true, false]}

  belongs_to :band,
    primary_key: :id,
    foreign_key: :band_id,
    class_name: :Band

  has_many :tracks,
    primary_key: :id,
    foreign_key: :album_id,
    class_name: :Track,
    dependent: :destroy

  def album_type
    live_album ? "Live" : "Studio"
  end

end
