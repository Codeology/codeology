class Past_interview < ApplicationRecord
  validates :technical_score, numericality: { only_integer: true, less_than: 5, greater_than_or_equal_to: 0 }
  validates :communication_score, numericality: { only_integer: true, less_than: 5, greater_than_or_equal_to: 0 }
  validates :problem_solving_score, numericality: { only_integer: true, less_than: 5, greater_than_or_equal_to: 0 }
  validates :excitement_score, numericality: { only_integer: true, less_than: 5, greater_than_or_equal_to: 0 }
  validates :question_score, numericality: { only_integer: true, less_than: 5, greater_than_or_equal_to: 0 }
  validates :helpfulness_score, numericality: { only_integer: true, less_than: 5, greater_than_or_equal_to: 0 }
end