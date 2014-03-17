require 'rubygems'
require 'bundler/setup'

require 'csv'
require 'happymapper'

$LOAD_PATH << "."
require 'almanak'

file_contents = File.read('fixtures/20140221220000.xml')

CSV.open("gemeenten.csv", "wb") do |csv|
  collection = Almanak::Overheidsorganisaties.parse(file_contents)
  csv << ["gemeente.naam", "gemeente.afkorting", "gemeente.provincie", "gemeente.contact.telefoon", "gemeente.contact.emailadres", "gemeente.contact.internet", "gemeente.aantalInwoners", "gemeente.totaalZetels"]
  collection.gemeenten.each do |gemeente|
    csv << [gemeente.naam, gemeente.afkorting, gemeente.provincie, gemeente.contact.telefoon, gemeente.contact.emailadres, gemeente.contact.internet, gemeente.aantalInwoners, gemeente.totaalZetels]
  end
end