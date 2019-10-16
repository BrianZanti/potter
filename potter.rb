require 'faraday'
require 'pry'
key = '$2a$10$3eF.CQbj/5JJ/QP0y.pkcOyesRgOOR45UeUlG8xi6tPMZPdcOtPf6'
house = 'Gryffindor'
ootp = true

response = Faraday.get "https://www.potterapi.com/v1/characters?key=#{key}&house=#{house}&orderOfThePhoenix=#{ootp}"
puts response.body
