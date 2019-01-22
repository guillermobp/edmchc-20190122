class Encuentro < ApplicationRecord
  has_many :charlas, dependent: :destroy
  has_many :exponentes, dependent: :destroy
  has_many :ensayos, dependent: :destroy
  has_many :conciertos, dependent: :destroy

  has_one_attached :video
  has_many_attached :logos
  has_many_attached :fotos
  has_many_attached :fotos_ensayos
  has_one_attached :foto_quienes_somos
  has_one_attached :foto_coordinador
  has_many_attached :imagenes_prensa

  def charlas_por_dia
    charlas.group(:fecha).select(:fecha)
  end

  def conciertos_por_dia
    conciertos.order(:fecha).group(:fecha).select(:fecha)
  end

  def conciertos_ordenados
    conciertos.ordenados
  end

  def fotos_charlas
    ary = Array.new
    charlas.each do |c|
      c.fotos.each do |f|
        ary.push(f)
      end
    end
    ary
  end

  # def fotos_ensayos
  #   ary = Array.new
  #   ensayos.each do |e|
  #     e.fotos.each do |f|
  #       ary.push(f)
  #     end
  #   end
  #   ary
  # end

  def fotos_conciertos
    ary = Array.new
    conciertos.each do |c|
      c.fotos.each do |f|
        ary.push(f)
      end
    end
    ary
  end

  def hay_videos?
    videos != nil && videos.lines.count > 0
  end

end
