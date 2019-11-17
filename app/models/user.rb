class User < ApplicationRecord
     attr_accessor :remember_token
     validates :name,  presence: true, length: { maximum: 50 }
     validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
     has_secure_password
     
     class << self
          # 渡された文字列のハッシュ値を返す
          def digest(string)
               cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                            BCrypt::Engine.cost
               BCrypt::Password.create(string, cost: cost)
          end

          # ランダムなトークンを返す
          def new_token
               SecureRandom.urlsafe_base64
          end
     end

     # 永続セッションのためにユーザーをデータベースに記憶する
     def remember
          self.remember_token = User.new_token
          update_attribute(:remember_digest, User.digest(remember_token))
     end

     # ユーザーのログイン情報を破棄する
     def forget
          update_attribute(:remember_digest, nil)
     end

     # トークンがダイジェストと一致したらtrueを返す
     def authenticated?(attribute, token)
          digest = send("#{attribute}_digest")
          return false if digest.nil?
          BCrypt::Password.new(digest).is_password?(token)
     end
end
