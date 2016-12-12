require 'scraped'

class String
  def tidy
    gsub(/[[:space:]]+/, ' ').strip
  end
end

class MemberSection < Scraped::HTML
  field :name do
    tds[0].text.tidy
  end

  private

  def tds
    noko.xpath('td')
  end
end
