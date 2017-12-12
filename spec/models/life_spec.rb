describe "Game of Life" do
  let(:life) { Life.new(12, 12) }
  context "Any live cell with fewer than two live neighbors dies, as if caused by under-population" do
    it "with no live neighbors" do
      cell = life.grid_at(0, 0)
      cell.live!
      life.next_generation!
      cell.should be_dead
    end

    it "with one live neighbors" do
      cell = life.grid_at(0, 0)
      cell.live!

      neighbour_cell = life.grid_at(0, 1)
      neighbour_cell.live!

      life.next_generation!
      cell.should be_dead

      neighbour_cell.should be_dead
    end
  end

  context "Any live cell with two or three live neighbors lives on to the next generation" do
    it 'with two live neighbors' do
      cell = life.grid_at(2, 2)
      cell.live!

      grid_at_left = life.grid_at(1, 2)
      grid_at_left.live!

      grid_at_right = life.grid_at(3, 2)
      grid_at_right.live!

      life.next_generation!
      cell.should be_live
      grid_at_left.should be_dead
      grid_at_right.should be_dead
    end

    it "with three live neighbors" do
      cell = life.grid_at(2, 2)
      cell.live!

      grid_at_left = life.grid_at(1, 2)
      grid_at_left.live!

      grid_at_right = life.grid_at(3, 2)
      grid_at_right.live!

      grid_at_bottom = life.grid_at(2, 3)
      grid_at_bottom.live!

      life.next_generation!
      cell.should be_live
      grid_at_left.should be_live
      grid_at_right.should be_live
      grid_at_bottom.should be_live
    end
  end
end