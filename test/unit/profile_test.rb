require 'test_helper'

class ProfileTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: profiles
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  name       :string(255)
#  birthday   :date
#  bio        :text
#  color      :string(255)
#  twitter    :string(255)
#  created_at :datetime
#  updated_at :datetime
#

