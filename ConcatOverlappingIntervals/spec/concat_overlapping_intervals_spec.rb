require 'concat_overlapping_intervals'

RSpec.describe ConcatOverlappingIntervals do
  describe "#concat_intervals_array" do
    let(:subject) { ConcatOverlappingIntervals.new.concat_intervals_array(input) }

    context "example a" do
      let(:input) { [[8,10],[1,3],[2,6],[15,18]] }
      let(:output) { [[1,6],[8,10],[15,18]] }

      it { is_expected.to eq(output) }
    end

    context "example b" do
      let(:input) { [[1,4],[4,5]] }
      let(:output) { [[1,5]] }

      it { is_expected.to eq(output) }
    end

    context "when a tuple falls fully within another tuple" do
      let(:input) { [[1,8],[4,5],[10, 12]] }
      let(:output) { [[1,8], [10, 12]] }

      it { is_expected.to eq(output) }
    end
  end
end
