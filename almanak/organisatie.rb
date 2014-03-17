module Almanak
 class Organisatie
    include HappyMapper

    tag 'organisatie'
    namespace 'http://almanak.overheid.nl/schema/export/2.0'
    element :naam, String
  end
end