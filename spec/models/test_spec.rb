# == Schema Information
#
# Table name: tests
#
#  id         :integer          not null, primary key
#  pass_mark  :integer          not null
#  session    :string           not null
#  year       :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Test, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
