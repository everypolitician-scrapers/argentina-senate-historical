require 'scraped'

class MembersPage < Scraped::HTML
  field :members do
    trs.map do |row|
      MemberSection.new(response: response, noko: row)
    end
  end

  private

  def table
    noko.xpath('//table[@summary="Listado de Senadores Nacionales Historicos"]')
  end

  def trs
    table.xpath('tbody/tr')
  end
end
