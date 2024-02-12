# == Schema Information
#
# Table name: choices
#
#  id          :integer          not null, primary key
#  content     :string           not null
#  is_correct  :boolean          default(FALSE)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  question_id :integer          not null
#
# Indexes
#
#  index_choices_on_question_id  (question_id)
#
# Foreign Keys
#
#  question_id  (question_id => questions.id)
#
FactoryBot.define do
  factory :choice do
    content { "Brasília" }
    is_correct { true }
    question_id { 1 }
  end
end
