class Sex < ActiveHash::Base
  
  self.data = [
    { id: 1,  name: 'オス' },
    { id: 2,  name: 'メス' },
    { id: 3,  name: '選択しない' }
  ]

  include ActiveHash::Associations
  has_many :animals
end
