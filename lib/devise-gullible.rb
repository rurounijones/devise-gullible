# encoding: utf-8
require 'devise'
require 'devise-gullible/strategy'

# Add +:gullible+ strategies to defaults.
#
Devise.add_module(:gullible,
  :strategy => true,
  :route => :session,
  :controller => :sessions,
  :model => 'devise-gullible/model'
)
