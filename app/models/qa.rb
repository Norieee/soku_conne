class Qa < ApplicationRecord
  require 'csv'

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      # memo:IDが見つかれば、レコードを呼び出し、見つかれなければ、新しく作成
      qa = find_by(no: row["no"]) || new
      # memo:CSVからデータを取得し、設定する
      qa.attributes = row.to_hash.slice(*updatable_attributes)
      qa.save
    end
  end

  # 更新を許可するカラムを定義
  def self.updatable_attributes
    ["no", "category", "question", "answer"]
  end

  def self.search(search)
    if search != ""
      Qa.where('category LIKE(?) OR question LIKE(?) OR answer LIKE(?)',
               "%#{search}%", "%#{search}%", "%#{search}%"
      )
    else
      Qa.none
    end
  end
end
