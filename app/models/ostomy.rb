class Ostomy < ApplicationRecord
    #患者さんのストーマの記録
    has_one_attached :image
    belongs_to :patient
    has_many :comments
    has_many :favorites
    #通知機能
    has_many :notifications, dependent: :destroy
    #has_many :so_good, dependent: :destroy
    validates :color, {presence: true}
    validates :edema, {presence: true}
    validates :skin, {presence: true}

    #ストマの色
      enum color: {"pink":0,"red": 1,"brown": 2,"black": 3,"other":4}, _prefix:true
    #皮膚の色
      enum skin: {"same":0,"red":1,"brown":2,"black":3,"white":4,"blister":5}, _prefix: true
    #むくみ
      enum edema: {"normal":0,"edema":1}, _prefix: true
    #いいね
      def favorited_by?(staff)
        favorites.where(staff_id: staff.id).exists?
      end


    # 通知機能
      def create_notification_comment!(staff_id, comment_id)
        #コメントしたuserを見つけ出す
        temp_ids = Comment.select(:staff_id).where(ostomy_id: id)
        temp_ids.each do |temp_id|
          save_notification_comment!(staff_id, comment_id, temp_id['staff_id'])
        end
      end

      def save_notification_comment!(staff, comment_id, visited_id)
        # コメントは複数回することが考えられるため、１つの投稿に複数回通知する
        notification = staff.active_notifications.new(
          ostomy_id: id,
          comment_id: comment_id,
          visited_id: patient_id,
          action: 'comment'
        )
        notification.save if notification.valid?
      end
  end
