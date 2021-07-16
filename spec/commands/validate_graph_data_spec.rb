require 'rails_helper'

describe ValidateGraphData do
  def perform
    described_class.for(data: data)
  end
  let(:name) { 'Los heroes' }
  let(:neighbors) { ["Toesca", "Cal y Canto"] }
  let(:color) { 1 }
  let(:stations) do
    {
      name: name,
      neighbors: neighbors,
      color: color
    }
  end
  let(:data) { { metroStations: [ stations ]} }

  describe 'valid input' do
    context 'when all inputs are valid and present' do
      it { expect(perform).to eq(true) }
    end

    context 'when neighbors are empty list' do
      let(:neighbors) { [] }
      it { expect(perform).to eq(true) }
    end
  end

  describe 'missing fields' do
    context 'when color is missing' do
      let(:stations) { { name: name, neighbors: neighbors } }
      it { expect(perform).to eq(false) }
    end

    context 'when neighbor is missing' do
      let(:stations) { { name: name, color: color } }
      it { expect(perform).to eq(false) }
    end

    context 'when name is missing' do
      let(:stations) { { neighbors: neighbors, color: color } }
      it { expect(perform).to eq(false) }
    end
  end

  describe 'invalid fields' do
    describe 'invalid name' do
      context 'when name is nil' do
        let(:name) { nil }
        it {expect(perform).to eq(false) }
      end

      context 'when name is not string' do
        let(:name) { 3 }
        it {expect(perform).to eq(false) }
      end
    end

    describe 'invalid neighbors' do
      context 'when neighbors are nil' do
        let(:neighbors) { nil }
        it 'returns false' do
          expect(perform).to eq(false)
        end
      end
    end

    describe 'invalid color' do
      context 'when color is nil' do
        let(:color) { nil }
        it { expect(perform).to eq(false)}
      end

      context 'when color is not in accepted values' do
        let(:color) { 3 }
        it {expect(perform).to eq(false)}
      end
    end
  end

  describe 'invalid object' do
    context "when metro stations is not object" do
      context 'when data is nil' do
        let(:data) { nil }
        it { expect(perform).to eq(false) }
      end

      context 'when data is array' do
        let(:data) { [] }
        it { expect(perform).to eq(false) }
      end

      context 'when data is empty object' do
        let(:data) { {} }
        it { expect(perform).to eq(false) }
      end

      context 'when metroStation is empty array' do
        let(:data) { { metroStations: [] } }
        it { expect(perform).to eq(false) }
      end
    end
  end
end
