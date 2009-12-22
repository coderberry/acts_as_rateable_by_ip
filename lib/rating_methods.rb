module ActsAsRateableByIp

  module Rating

    def self.included(rating_model)
      rating_model.extend Finders
    end

    module Finders

      # Helper class method to look up all comments for
      # rateable class name and rateable id.
      def find_ratings_for_rateable(rateable_str, rateable_id)
        find(:all,
          :conditions => ["rateable_type = ? and rateable_id = ?", rateable_str, rateable_id],
          :order => "created_at DESC"
        )
      end

      # Helper class method to look up a rateable object
      # given the rateable class name and id 
      def find_rateable(rateable_str, rateable_id)
        rateable_str.constantize.find(rateable_id)
      end

      def find_current_rating(rateable_str, rateable_id)
        ratings = find_ratings_for_rateable(rateable_str, rateable_id)
        if ratings.length > 0
          rating = (ratings.sum(&:rating).to_f / ratings.length.to_f)
          return rating
        else
          return nil
        end
      end

    end
  end
end