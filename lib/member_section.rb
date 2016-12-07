require 'scraped'

class MemberSection < Scraped::HTML
  field :name do
    row[0].text
  end
end
