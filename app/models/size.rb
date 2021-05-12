class Size < ActiveHash::Base
  
  self.data = [
    { id: 1,  name: '---' },
    { id: 2,  name: '超小型' },
    { id: 3,  name: '小型' },
    { id: 4,  name: '中型' },
    { id: 5,  name: '大型' },
    { id: 6,  name: '選択しない' }
  ]

  include ActiveHash::Associations
  has_many :animals
  
end
