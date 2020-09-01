# アプリ名
即コネ（即CONNECTION）

# 概要
## BtoBにて第一報のハードルを下げコミュニケーションをより円滑にするためのアプリ
<dl>
  <dt>即コンタクト</dt>
  <dd>用件のみを端的に伝達可能（型式ばったメールを使用しない）</dd>
  <dd>用件が選択式となっており、多忙な合間にパッと送信可能</dd>
  <dt>即検索</dt>
  <dd>取りまとめているQAリストを外部から検索・参照可能</dd>
  <dd>顧客及び業務関係者はQAリストにて自己解決可能</dd>
  <dd>回答者は新規の質問にのみ対応することが可能</dd>
</dl>

# 制作背景(意図)
## 業務における以下課題（ムダやジレンマ）を解決したい
**業務の効率化を図る**
- 型式ばったメールは作成時間がムダ
- 何度も同じ質問を受け、都度回答をする時間がムダ
- 問い合わせ側は相手が回答を持っている場合、待機時間がムダ
**迅速な情報共有**
- 急ぎで情報共有が状況があるも、多忙な時こそ疎かになりがち
- 現場側とマネジメント側で共有タイミングの乖離が起こりがち

# DEMO(gifで動画や写真を貼って、ビューのイメージを掴んでもらいます)
追記予定

# 実装予定の内容
追記予定

# テーブル設計

## users テーブル

| Column     | Type   | Options                   |
| ---------- | ------ | ------------------------- |
| first_name | string | null: false               |
| last_name  | string | null: false               |
| company    | string | null: false               |
| email      | string | null: false, unique: true |
| password   | string | null: false               |

### Association

- has_many :pro_users
- has_many :projects, through: pro_users
- has_many :messages

## projects テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

### Association

- has_many :pro_users
- has_many :users, through: pro_users
- has_many :messages

## pro_users テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| project | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :project

## messages テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| gist_id     | integer    | null: false                    |
| urgency_id  | integer    | null: false                    |
| response_id | integer    | null: false                    |
| res_type_id | integer    |                                |
| content_id  | integer    | null: false                    |
| sup_content | string     |                                |
| status_id   | integer    | null: false                    |
| others      | string     |                                |
| user        | references | null: false, foreign_key: true |
| project     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :project