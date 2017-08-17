class Ltrain < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :rt, presence: true
  validates :destNm, presence: true
  validates :stpId, presence: true
  validates :staNm, presence: true
end
