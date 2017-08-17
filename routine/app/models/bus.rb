class Bus < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :rt, presence: true
  validates :rtnm, presence: true
  validates :rtdir, presence: true
  validates :stpid, presence: true
  validates :stpnm, presence: true
end
