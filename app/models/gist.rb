class Gist < ApplicationRecord
  self.data = [
    { id: 1, name: '報告' },
    { id: 2, name: '相談' },
    { id: 3, name: '質問' }
  ]
end