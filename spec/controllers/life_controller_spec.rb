require 'rails_helper'

RSpec.describe LifeController, type: :controller, order: :defined do
  subject { Life.new(12,12) }

  describe '#neighbors count' do
    before { subject.load([[2,1], [2,2], [2,3]]) }

    it 'expect return 2 for 2,2' do
      expect(subject.neighbors_count(2, 2)).to eq(2)
    end

    it 'expect return 3 for 1,2' do
      expect(subject.neighbors_count(1, 2)).to eq(3)
    end

    it 'expect return zero for 0,0' do
      expect(subject.neighbors_count(0, 0)).to eq(0)
    end
  end
end