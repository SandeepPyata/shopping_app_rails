# == Schema Information
#
# Table name: addresses
#
#  id               :integer          not null, primary key
#  location_details :text
#  user_id          :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Address < ApplicationRecord
  belongs_to :user
end
