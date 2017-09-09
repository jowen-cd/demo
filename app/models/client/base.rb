require 'active_resource'
module Client
  class Base < ActiveResource::Base
    self.site = 'http://localhost:3000/api/'
    
  end
end
