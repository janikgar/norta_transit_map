class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable
  
  devise :database_authenticatable, :registerable, :rememberable, :trackable, :omniauthable, omniauth_providers: %i[facebook]
end
