class ChoiceMonthlyPlan < ApplicationRecord
  belongs_to :monthly_plan
  belongs_to :student
end
