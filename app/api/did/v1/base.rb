module DID::V1
  class Base < Grape::API
    mount DID::V1::Users

    add_swagger_documentation(
      api_version: "did/v1",
      hide_documentation_path: true,
      mount_path: "/did/v1/swagger_doc",
      hide_format: true
    )
  end
end
