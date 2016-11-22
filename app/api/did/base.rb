require "grape-swagger"
module DID
  class Base < Grape::API
    mount DID::V1::Base
  
  end
end
