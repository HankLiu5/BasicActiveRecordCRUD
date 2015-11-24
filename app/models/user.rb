class User < ActiveRecord::Base
  has_one :profile, dependent: :destroy
  has_many :todo_lists, dependent: :destroy
  has_many :todo_items, through: :todo_lists, source: :todo_items
  # make sure the username is not empty.
  validates :username, presence: true

  has_secure_password

  def get_completed_count(user)
    # first find out what todo_item is completed in user, then count.
    user.todo_items.where(:completed => true).count
  end
end
