require 'rails_helper'

RSpec.describe Edge, type: :model do
  it 'has a valid factory' do
    expect(build(:edge)).to be_valid
  end

  describe 'associations' do
    it {is_expected.to belong_to(:source)}
    it {is_expected.to belong_to(:target)}
  end

  describe '#update_cost' do
    let(:train_color ) { 0 }
    let(:source) { create(:station, color: 0) }
    let(:target) { create(:station, color: 0) }
    let(:edge) { build(:edge, source_id: source[:id], target_id: target[:id])}

    context 'when train has no color' do
      it 'cost is 1' do
        new_cost = edge.new_cost train_color
        expect(new_cost).to eq(1)
      end
    end

    context 'when train has color' do
      let(:train_color) { 1 }

      context 'when source and target have same color' do
        context 'when both are colorless' do
          it 'cost is 1' do
            new_cost = edge.new_cost train_color
            expect(new_cost).to eq(1)
          end
        end

        context 'when same color as train' do
          let(:source) { create(:station, color: 1) }
          let(:target) { create(:station, color: 1) }
          it 'cost is 1' do
            new_cost = edge.new_cost train_color
            expect(new_cost).to eq(1)
          end
        end

        context 'when different color than train' do
          let(:source) { create(:station, color: 2) }
          let(:target) { create(:station, color: 2) }
          it 'cost is 1' do
            new_cost = edge.new_cost train_color
            expect(new_cost).to eq(1)
          end
        end
      end

      context 'when source and target have different color' do
        context 'when source has no color' do
          context 'when target has same color as train' do
            let(:source) { create(:station, color: 0) }
            let(:target) { create(:station, color: 1) }
            it 'cost is 1' do
              new_cost = edge.new_cost train_color
              expect(new_cost).to eq(1)
            end
          end

          context 'when target has different color than train' do
            let(:source) { create(:station, color: 0) }
            let(:target) { create(:station, color: 2) }
            it 'cost is 1' do
              new_cost = edge.new_cost train_color
              expect(new_cost).to eq(1)
            end
          end
        end

        context 'when source has same color as train' do
          context 'when target has no color' do
            let(:source) { create(:station, color: 1) }
            let(:target) { create(:station, color: 0) }
            it 'cost is 1' do
              new_cost = edge.new_cost train_color
              expect(new_cost).to eq(1)
            end
          end

          context 'when target has color distinct than train' do
            let(:source) { create(:station, color: 1) }
            let(:target) { create(:station, color: 2) }
            it 'cost is 1' do
              new_cost = edge.new_cost train_color
              expect(new_cost).to eq(0)
            end
          end
        end

        context 'when source has different color as train' do
          context 'when target has no color' do
            let(:source) { create(:station, color: 2) }
            let(:target) { create(:station, color: 0) }
            it 'cost is 1' do
              new_cost = edge.new_cost train_color
              expect(new_cost).to eq(1)
            end
          end

          context 'when target has same color as train' do
            let(:source) { create(:station, color: 2) }
            let(:target) { create(:station, color: 1) }
            it 'cost is 1' do
              new_cost = edge.new_cost train_color
              expect(new_cost).to eq(0)
            end
          end
        end
      end
    end
  end
end
