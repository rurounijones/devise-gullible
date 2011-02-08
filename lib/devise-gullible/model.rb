require 'strategy'

module Devise
  module Models
    # Authenticatable Module, responsible for encrypting password and validating
    # authenticity of a user while signing in.
    #
    # == Options
    #
    # DatabaseAuthenticable adds the following options to devise_for:
    #
    #   * +stretches+: the cost given to bcrypt.
    #
    # == Examples
    #
    #    User.find(1).valid_password?('password123')         # returns true/false
    #
    module Gullible
      extend ActiveSupport::Concern

      def after_database_authentication
      end

    protected

      module ClassMethods
        Devise::Models.config(self, :pepper, :stretches)

        # We assume this method already gets the sanitized values from the
        # DatabaseAuthenticatable strategy. If you are using this method on
        # your own, be sure to sanitize the conditions hash to only include
        # the proper fields.
        def find_for_database_authentication(conditions)
          find_for_authentication(conditions)
        end
      end
    end
  end
end

