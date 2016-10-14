module DID::V1
  class Users < Grape::API
    include DID::V1::Defaults

    resource :users do
      desc "Return all users"
      get "", root: :users do
        User.all
      end

      desc "Return a user"
      params do
        requires :id, type: Integer, desc: "ID of the user"
      end
      # get ":id", root: "users" do
      get "users/:id" do
        User.where(id: permitted_params[:id]).first!
      end
    end

  end
end
