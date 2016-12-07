require 'net/http'
require 'pry'
require 'require_all'

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

page = MembersPage.new(response: Net::HTTP.post_form(url, params))
