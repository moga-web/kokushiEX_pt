# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  content    :text             not null
#  image_url  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  test_id    :integer          not null
#
# Indexes
#
#  index_questions_on_test_id  (test_id)
#
# Foreign Keys
#
#  test_id  (test_id => tests.id)
#
class Question < ApplicationRecord
    belogs_to :test
    has_many :choices, dependent: :destroy
    
    validates :content, presence: true
end
