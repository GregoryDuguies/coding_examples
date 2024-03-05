require 'zero_matrix_rows_columns'

RSpec.describe ZeroMatrixRowsColumns do
  describe "#set_to_zero_if_zero" do
    let(:subject) { ZeroMatrixRowsColumns.new.set_to_zero_if_zero(input_matrix) }

    context "example a" do
      let(:input_matrix) { [[2, 1 ,1], [1, 0, 1], [2, 1, 0]] }
      let(:output_matrix) { [[2, 0 ,0], [0, 0, 0], [0, 0, 0]] }

      it { is_expected.to eq(output_matrix) }
    end

    context "example b" do
      let(:input_matrix) { [[0, 1 ,1], [1, 1, 1], [1, 1, 1]] }
      let(:output_matrix) { [[0, 0 ,0], [0, 1, 1], [0, 1, 1]] }

      it { is_expected.to eq(output_matrix) }
    end
  end
end
