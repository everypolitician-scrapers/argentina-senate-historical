require 'scraped'

class MemberSection < Scraped::HTML
  field :name do
    noko.xpath('td')[0].text
  end
end
