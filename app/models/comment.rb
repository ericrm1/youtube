class Comment < ApplicationRecord
  belongs_to :video
  belongs_to :channel
  

  validates :content, presence: true
  validates :video_id, presence: true

  def comment_time_count_string
    date = created_at.in_time_zone(Time.zone) # Ajusta para o fuso configurado no Rails
    today = Time.zone.now

    days = (today.to_date - date.to_date).to_i # Garante que a diferença de dias seja correta

    if days == 0
      hours = (today - date) / 1.hour
      if hours < 1
        minutes = (today - date) / 1.minute
        return minutes < 5 ? "agora há pouco" : "há #{minutes.to_i} minutos"
      else
        return "há #{hours.to_i} horas"
      end
    elsif days == 1
      return "há 1 dia"
    elsif days < 30
      return "há #{days} dias"
    elsif days < 365
      return "há #{days / 30} mês#{days / 30 > 1 ? "es" : ""}"
    else
      return "há #{days / 365} ano#{days / 365 > 1 ? "s" : ""}"
    end
  end  

  
end

