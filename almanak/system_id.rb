module Almanak
  class SystemId
    include HappyMapper

    tag 'systemId'
    namespace 'http://almanak.overheid.nl/schema/export/2.0'
    element :systemId, Integer
  end
end