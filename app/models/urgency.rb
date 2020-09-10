class Urgency < ActiveHash::Base
  self.data = [
    { id: 1, name: '緊急' },
    { id: 2, name: '不急' }
  ]
end