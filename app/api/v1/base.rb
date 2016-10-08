module V1
  class Base < Grape::API
    version      'v1'
    format       :json

    # Mount the APIs
    mount UsersApi
  end
end
