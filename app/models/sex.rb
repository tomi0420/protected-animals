class Sex < ActiveHash::Base
  
  self.data = [
    { id: 1,  name: '---' },
    { id: 2,  name: 'オス' },
    { id: 3,  name: 'メス' },
    { id: 4,  name: '選択しない' }
  ]

  include ActiveHash::Associations
  has_many :animals
end
