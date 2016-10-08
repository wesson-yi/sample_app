module V1
  module Entities
    class UserBasic < Entities::Base
      format_with(:iso8601) { |dt| dt.iso8601 }

      expose :id
      expose :name
      # 如果需要输出层级对象，可以按这种方式
      # expose :company, using: Entities::Company
    
      # 日期、时间一律使用ISO 8601
      expose :created_at, format_with: :iso8601
      
       # with_options(format_with: :iso8601) do
       #   expose :created_at
       # end
    end
  end
end
