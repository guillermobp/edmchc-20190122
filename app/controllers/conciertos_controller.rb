class ConciertosController < ApplicationController

    def index
        @conciertos = Encuentro.last.conciertos.ordenados
    end

    def show
        @concierto = Concierto.find(params[:id])
    end

    def new
        @concierto = Concierto.new
        @concierto.encuentro = Encuentro.last
    end

    def edit
        @concierto = Concierto.find(params[:id])
    end

    def create
        @concierto = Concierto.new(concierto_params)
        @concierto.encuentro = Encuentro.last
        if @concierto.save
            flash[:notice] = 'El concierto ha sido creado exitosamente'
            redirect_to @concierto
        else
            flash[:alert] = 'Ha ocurrido un error intentando crear el concierto'
            redirect_to new_concierto_path
        end
    end

    def update
        @concierto = Concierto.find(params[:id])
        if @concierto.update(concierto_params)
            flash[:notice] = 'El concierto ha sido actualizado exitosamente'
            redirect_to @concierto
        else
            flash[:alert] = 'Ha ocurrido un error intentando actualizar el concierto'
            redirect_to edit_concierto_path(@concierto)
        end
    end

    def destroy
    end

    def fotos
      @fotos = Concierto.find(params[:id]).fotos
      render layout: 'home'
    end

    private

        def concierto_params
            params.require(:concierto).permit(:fecha, :hora, :lugar, :obras, :compositor, :titulo, :interpretes, :videos, :video_url, fotos: [])
        end

end
