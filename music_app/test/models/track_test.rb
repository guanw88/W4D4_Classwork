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

require 'test_helper'

class TrackTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
