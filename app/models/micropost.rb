class Micropost < ApplicationRecord
<<<<<<< HEAD
  validates(:user_id, presence: true)
  validates(:content, presence: true)
=======
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates(:user_id, presence: true)
  validates(:content, presence: true,
                      length: { maximum: 140 })
>>>>>>> 9586a77f9da9fc4c54fc627604d5aa161f68d2db
end
