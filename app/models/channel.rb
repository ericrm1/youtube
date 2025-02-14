class Channel < ApplicationRecord
    has_secure_password
    has_one_attached :photo

    has_many :videos
    has_many :comments
    has_many :histories
    has_many :ratings, dependent: :destroy

    validates :name, presence: true
    validates :email,presence:true
    validates :password, presence: true, length: {minimum: 6 }

    def watched_videos
        videos = []
        histories.each do |history|
            videos << history.video
        end
        return videos 
    end

    def history_view_day(history)
        return "Sem histórico" unless history
        view_day = history.created_at.in_time_zone(Time.zone) # Ajusta para o fuso configurado no Rails
        today = Time.zone.now
        days = (today.to_date - view_day.to_date).to_i
        if days < 7
          # Retorna o dia da semana (ex: "Segunda", "Terça" ...)
          return I18n.l(view_day, format: "%A", locale: :pt).capitalize
        elsif days < 30
          # Retorna o dia e o mês (ex: "1 de fev.")
          return view_day.strftime("%-d de %b.")
        else
          # Retorna o dia, mês e ano (ex: "31 de dez. de 2024")
          return view_day.strftime("%-d de %b. de %Y")
        end
      end
end