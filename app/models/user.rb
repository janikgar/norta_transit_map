class User < ApplicationRecord
    def self.create_with_omniauth(auth)
        create! do |user|
            user.provider = auth["provider"]
            user.uid = auth["uid"]
            user.name = auth["info"]["name"]
            user.image = auth["info"]["image"]
        end
    end
    # Pull avatars from FB:
    def largeimage
        "http://graph.facebook.com/#{self.uid}/picture?type=large"
    end
    
    def normalimage
        "http://graph.facebook.com/#{self.uid}/picture?type=normal"
    end
end
