require 'devise/strategies/authenticatable'

module Devise
  module Strategies
    # Lobotomised version of database_authenticatable, checks that the identifier is in the database with no password functionality.
    class Gullible < Authenticatable
      def authenticate!
        resource = mapping.to.find_for_database_authentication(authentication_hash)
        if resource
          success!(resource)
        else
          fail(:invalid)
        end
      end
    end
  end
end

Warden::Strategies.add(:gullible, Devise::Strategies::Gullible)


