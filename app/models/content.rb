class Content < ApplicationRecord
  self.data = [
    { id: 1, name: 'プロトコル' },
    { id: 2, name: '逸脱' },
    { id: 3, name: '手続き' },
    { id: 4, name: 'その他' }
  ]
end