class Blog < ActiveRecord::Base
    validates :title, presence: true #バリデーションチェック、空文字禁止
    belongs_to :user
end
