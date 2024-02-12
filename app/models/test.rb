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
class Test < ApplicationRecord
    validates :pass_mark, presence: true
    validates :session, presence: true, inclusion: { in: %w[AM PM] }
    validates :year, presence: true
end
