require 'net/http'
require 'pp'
require 'pry'
require 'require_all'
require 'scraped_page_archive/open-uri'

require_rel 'lib'

url = URI.parse('http://www.senado.gov.ar/senadores/Historico/FechaResultado')

params = {
  'senado_senadoresbundle_busquedahistoricostype%5BfechaDesde%5D%5Bday%5D' => 1,
  'senado_senadoresbundle_busquedahistoricostype%5BfechaDesde%5D%5Bmonth%5D' => 1,
  'senado_senadoresbundle_busquedahistoricostype%5BfechaDesde%5D%5Byear%5D' => 2015,
  'senado_senadoresbundle_busquedahistoricostype%5BfechaHasta%5D%5Bday%5D' => 1,
  'senado_senadoresbundle_busquedahistoricostype%5BfechaHasta%5D%5Bmonth%5D' => 1,
  'senado_senadoresbundle_busquedahistoricostype%5BfechaHasta%5D%5Byear%5D' => 2016
}

request = Scraped::Request.new(url: url, strategies: [{ strategy: NetHttpPostRequest, params: params }])
page = MembersPage.new(response: request.response).members.each do |member|
  pp member.to_h
end
