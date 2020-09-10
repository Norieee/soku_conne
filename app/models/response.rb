class Response < ActiveHash::Base
  self.data = [
    { id: 1, name: '返信希望' },
    { id: 2, name: '返信不要' }
  ]
end