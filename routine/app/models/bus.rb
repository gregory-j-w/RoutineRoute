class Bus < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum: 60 }
  validates :rt, presence: true
  validates :rtnm, presence: true
  validates :rtdir, presence: true
  validates :stpid, presence: true
  validates :stpnm, presence: true
end
