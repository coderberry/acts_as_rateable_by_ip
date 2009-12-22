class Rating < ActiveRecord::Base

  include ActsAsRateableByIp::Rating
  belongs_to :rateable, :polymorphic => true
  default_scope :order => 'created_at ASC'

end