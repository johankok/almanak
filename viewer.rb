require 'rubygems'
require 'bundler/setup'

require 'csv'
require 'happymapper'

file_contents = File.read('20140221220000.xml')

# puts file_contents

module Almanak
  class SystemId
    include HappyMapper

    tag 'systemId'
    namespace 'http://almanak.overheid.nl/schema/export/2.0'
    element :systemId, Integer
  end

  class Contact
    include HappyMapper

    tag 'contact'
    namespace 'http://almanak.overheid.nl/schema/export/2.0'

    element :telefoon, String
    element :emailadres, String
    element :internet, String
  end

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

  class Organisatie
    include HappyMapper

    tag 'organisatie'
    namespace 'http://almanak.overheid.nl/schema/export/2.0'
    element :naam, String
  end

  class Overheidsorganisaties
    include HappyMapper

    tag 'overheidsorganisaties'
    namespace 'http://almanak.overheid.nl/schema/export/2.0'
    has_many :organisaties, Organisatie
    has_many :gemeenten, Gemeente
  end
end

CSV.open("gemeenten.csv", "wb") do |csv|
  collection = Almanak::Overheidsorganisaties.parse(file_contents)
  collection.gemeenten.each do |gemeente|
    # puts "#{g.naam}, #{g.afkorting}, #{g.type}, #{g.provincie} #{g.contact.telefoon} #{g.contact.emailadres} #{g.contact.internet}"
    csv << [gemeente.naam, gemeente.afkorting, gemeente.provincie, gemeente.contact.telefoon, gemeente.contact.emailadres, gemeente.contact.internet]
  end
end