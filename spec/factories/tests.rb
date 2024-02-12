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
FactoryBot.define do
  factory :test do
    pass_mark { 50 }
    session { "AM" }
    year { 2020 }
  end
end
