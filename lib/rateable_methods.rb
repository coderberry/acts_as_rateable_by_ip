require 'activerecord'

# ActsAsRateableByIp
module Rateable #:nodoc:

  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def acts_as_rateable_by_ip
      has_many :ratings, :as => :rateable, :dependent => :destroy
      include Rateable::InstanceMethods
      extend Rateable::SingletonMethods
    end
  end

  # This module contains class methods
  module SingletonMethods
    # Helper method to lookup for ratings for a given object.
    # This method is equivalent to obj.comments.
    def find_ratings_for(obj)
      rateable = ActiveRecord::Base.send(:class_name_of_active_record_descendant, self).to_s

      Rating.find(:all,
        :conditions => ["rateable_id = ? and rateable_type = ?", obj.id, rateable],
        :order => "created_at DESC"
      )
    end

    # Helper class method to lookup ratings for
    # the mixin rateable type by IP Address.
    def find_comments_by_ip(ip_address)
      rateable = ActiveRecord::Base.send(:class_name_of_active_record_descendant, self).to_s

      Rating.find(:all,
        :conditions => ["ip_address = ? and rateable_type = ?", ip_address, rateable],
        :order => "created_at DESC"
      )
    end
  end

  # This module contains instance methods
  module InstanceMethods
    # Helper method that defaults the submitted time.
    def add_rating(rating)
      ratings << rating
    end
  end

end

ActiveRecord::Base.send(:include, Rateable)
