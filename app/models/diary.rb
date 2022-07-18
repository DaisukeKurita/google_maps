class Diary < ApplicationRecord
  # タイトルが空の場合は、バリデーションを発生させる
  validates :title, presence: true
  # モデルの中で、オブジェクトの住所がどこにあるかを geocoder に伝える
  geocoded_by :address
  # addressカラムに入った情報を元に『latitude』『longitude』に緯度・経度の情報が入る
  after_validation :geocode
end
