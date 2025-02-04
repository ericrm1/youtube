class Video < ApplicationRecord
  has_one_attached :file
  has_one_attached :thumbnail

  belongs_to :channel
  
  has_many :histories
  has_many :watching_channels, through: :histories, source: :channel
  has_many :ratings, dependent: :destroy
  
  has_many :comments

  validates :title, presence: true
  validates :thumbnail, presence: true
  validates :file, presence: true
 
  def likes_count
    ratings.where(value: 1).count
  end

  def dislikes_count
    ratings.where(value: -1).count
  end

  def views_count
    histories.count
  end

  def views_count_string
    views = views_count
    if views == 0
      return "nenhuma visualização"
    elsif views == 1 
      return " #{views} visualização"
    elsif views > 1 && views < 1000000
      return "#{views} visualizações"
    elsif views > 1000000
      return "#{views/1000000} mi de visualizações"
    end
  end

  def time_count_string
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