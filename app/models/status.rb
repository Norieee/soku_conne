class Status < ApplicationRecord
  self.data = [
    { id: 1, name: '解決済' },
    { id: 2, name: '未解決（対応中）' }
  ]
end