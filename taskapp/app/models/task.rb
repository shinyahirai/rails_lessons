class Task < ActiveRecord::Base
  belongs_to :project # model作成時のreferencesにより自動生成されたコード
  validates :title, presence: true
end
