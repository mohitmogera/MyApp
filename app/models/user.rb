class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable,:trackable, :validatable

         def generate_jwt
          puts("generate jwt key")
          puts(Rails.application.secret_key_base)
          JWT.encode({ id: id,
                      exp: 60.days.from_now.to_i },
                     Rails.application.secret_key_base)
        end
end
