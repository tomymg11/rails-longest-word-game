require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = [*('A'..'Z')].sample(15).join
  end

  def score
    @letters = params[:letters]
    @answer = params[:answer].upcase
    @include = include?(@answers, @letters)
    @check = check(@answer)
  end

  def check(answer)
    url = "https://wagon-dictionary.herokuapp.com/:#{answer}"
    @repo = JSON.parse(open(url).read)
  end
end
