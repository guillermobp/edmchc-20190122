class Concierto < ApplicationRecord
  belongs_to :encuentro

  has_many_attached :fotos

  scope :ordenados, -> { order(:fecha, :hora) }

  def fecha_display
    I18n.l(fecha, format: :day_name_day_number_month_name)
  end

  def hora_display
    I18n.l(hora, format: :short)
  end

  def hay_videos?
    videos != nil && videos.lines.count > 0
  end

  def tiene_video?
    video_url != nil && video_url != ''
  end
end
