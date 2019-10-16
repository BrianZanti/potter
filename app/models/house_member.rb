class HouseMember
  attr_reader :name,
              :house,
              :patronus,
              :role
              
  def initialize(attributes)
    @name = attributes[:name]
    @house = attributes[:house]
    @patronus = attributes[:patronus]
    @role = attributes[:role]
  end
end
