module Almanak
  class Gemeente
    include HappyMapper

    tag 'gemeente'
    namespace 'http://almanak.overheid.nl/schema/export/2.0'

    element :systemId, SystemId
    element :naam, String
    element :afkorting, String
    element :type, String
    element :provincie, String, tag: 'provincieAfkorting'
    element :contactEmail, String
    element :aantalInwoners, Integer
    element :totaalZetels, Integer
    has_one :contact, Contact
  end
end