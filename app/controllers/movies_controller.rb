class MoviesController < ApplicationController
  before_action :set_movie, only: %i[ show update destroy ]

  # GET /movies
  def index
    @movies = Movie.select(:id, :title, :genre, :release_year, :country , :date_added, :description ).order(:release_year)
    
    # Filtragem por ano
    @movies = @movies.where("genre like ? and country like ? and release_year like ?" ,"%#{params[:genre]}%", "%#{params[:country]}%", "%#{params[:release_year]}%")  

    render json: @movies
  end

  def read_csv
    csv_data  = []

    #Leitura do arquivo csv. Transforma em hash e insere na array csv_data
    CSV.foreach('app/data/TT_ 4 - netflix_titles.csv', headers: true) do |row|
      csv_data << row.to_hash
    end 

    #converte o valor do campo date_added(string) para Date e modifica  a key type para genre
    csv_data.each do |item|
      item['genre'] = item['type']
      item.delete('type')
      item['date_added'] = Date.strptime(item['date_added'],"%h %d, %y")
    end

    #insere todos os valores no Banco de Dados
    csv_data.each do |movie_data|
      Movie.create(movie_data)
    end   

    render json: Movie.all
  end

  # POST /movies
  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      render json: @movie, status: :created, location: @movie
    else
      render json: @movie.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /movies/1
  def update
    if @movie.update(movie_params)
      render json: @movie
    else
      render json: @movie.errors, status: :unprocessable_entity
    end
  end

  # DELETE /movies/1
  def destroy
    @movie.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def movie_params
      params.require(:movie).permit(:type, :country,:release_year)
    end
end
