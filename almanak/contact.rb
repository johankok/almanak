module Almanak
  class Contact
    include HappyMapper

    tag 'contact'
    namespace 'http://almanak.overheid.nl/schema/export/2.0'

    element :telefoon, String
    element :emailadres, String
    element :internet, String
  end
end