class Tree
  attr_accessor :child, :data, :parent
  
  def initialize(data)
    @data = data
    @child = []
    @parent = nil
  end
end