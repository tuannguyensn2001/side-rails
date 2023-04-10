class Test < ApplicationRecord
  validates :name, :time_to_do, :do_once, :prevent_cheat, :show_mark, :show_answer, presence: true
end
