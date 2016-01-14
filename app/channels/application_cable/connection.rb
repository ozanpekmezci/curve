module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
      logger.add_tags 'ActionCable', current_user.name
    end

    protected
      def find_verified_user
        #https://github.com/gregmolnar/actioncable-examples/commit/7ae0fd0267a7d6033f5faac92e9ff4cb92fb9714
        verified_user = User.find_by(id: cookies.signed['user.id'])
          logger.add_tags 'VerifyUser', verified_user
          if verified_user
            ##gecici 
            #&& cookies.signed['user.expires_at'] > Time.now
               verified_user
        else
          reject_unauthorized_connection
        end
      end
  end
end
