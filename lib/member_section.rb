require 'scraped'

class MemberSection < Scraped::HTML
  field :name do
    tds[0].text
  end

  private

  def tds
    noko.xpath('td')
  end
end
