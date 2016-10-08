module V1
  class API < Grape::API
    version 'v1', using: :header, vendor: 'v1'
    format :json
    prefix "api"

    resource :users do
      desc "get all users information"
      get :public_timeline do
        User.limit(20)
      end

      desc "return a users"
      params do 
        requires :id, :type => String
      end
      route_param :id do
        get do 
          User.find(params[:id])
        end
      end

    end
  end
end
