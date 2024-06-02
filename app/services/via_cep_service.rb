class ViaCepService
  include HTTParty
  base_uri 'https://viacep.com.br/ws'

  def self.get_address(zipcode)
    response = get("/#{zipcode}/json/")
    if response.success?
      data = JSON.parse(response.body)
      {
        address: data['logradouro'],
        neighborhood: data['bairro'],
        city: data['localidade'],
        state: data['uf']
      }
    else
      nil
    end
  end
end