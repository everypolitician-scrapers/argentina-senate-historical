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

  field :start_date do
    dates[0]
  end

  field :end_date do
    dates[1]
  end

  field :party do
    tds[5].text.tidy
  end

  field :constituency do
    tds[4].text.tidy
  end

  field :replacement do
    tds[6].text.tidy
  end

  private

  def tds
    noko.xpath('td')
  end

  def dates
    tds[3].text.split('al').map(&:tidy).reject{ |str| str=='Sin Fecha' }
  end
end
