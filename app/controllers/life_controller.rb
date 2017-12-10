class LifeController < ApplicationController
  before_action :initial, only: [:index, :start, :clear]

  def index
    @@life = Life.new(@cols, @rows)
  end

  def start
    cells = []
    if params[:load] == 'true'
      params[:cells].to_hash.values.each do |col, row|
        cells.push([col.to_i, row.to_i])
      end
      @@life.load cells
    end
    @grid = @@life.execute
  end

  def clear
    @@life = Life.new(@cols, @rows)
  end

  private

  def initial
    @rows = 12
    @cols = 12
  end
end
