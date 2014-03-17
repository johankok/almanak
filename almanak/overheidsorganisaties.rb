module Almanak
  class Overheidsorganisaties
    include HappyMapper

    tag 'overheidsorganisaties'
    namespace 'http://almanak.overheid.nl/schema/export/2.0'
    has_many :organisaties, Organisatie
    has_many :gemeenten, Gemeente
  end
end