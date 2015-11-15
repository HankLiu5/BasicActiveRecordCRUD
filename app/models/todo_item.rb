class TodoItem < ActiveRecord::Base
  belongs_to :todo_list

  default_scope { order :due_date }

# Set a method to count the number of completed items in TodoItem class.
  def self.count_completed_items
    i = TodoItem.where(:completed => true).count
  end
end
