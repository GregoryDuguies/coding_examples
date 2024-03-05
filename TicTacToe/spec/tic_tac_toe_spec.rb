require 'tic_tac_toe'

RSpec.describe TicTacToe do
  describe "#determine_game_state" do
    let(:subject) { TicTacToe.new.determine_game_state(input) }

    context "Error" do
      context "when input isn't 9 elements" do
        let(:input) { "o,x,O,X,o,,,,x,o,X,O" }

        it { is_expected.to eq('Error') }
      end

      context "when input contains invalid elements" do
        let(:input) { "a,x,O,X,o,x,o,,b" }

        it { is_expected.to eq('Error') }
      end

      context "when input is an invalid sequence of turns" do
        let(:input) { "x,x,x,,,,,,o" }

        it { is_expected.to eq('Error') }
      end

      context "when game_state determines 2 winners" do
        let(:input) { "x,x,x,,,,o,o,o" }

        it { is_expected.to eq('Error') }
      end

      context "with a valid input, error should not be returned" do
        context "when input is a starting game state" do
          let(:input) { ",,,,,,,," }

          it { is_expected.not_to eq('Error') }
        end

        context "when input ends with '' value" do
          let(:input) { "o,x,o,x,o,x,x,o," }

          it { is_expected.not_to eq('Error') }
        end

        context "when input has mixed upper and lower cases" do
          let(:input) { "x,O,X,,,,,,o" }

          it { is_expected.not_to eq('Error') }
        end

        context "when second player has not taken their turn" do
          let(:input) { "x,,x,,,,,,o" }

          it { is_expected.not_to eq('Error') }
        end

        context "when both players have not taken their turn" do
          let(:input) { "x,,x,,,,,,o" }

          it { is_expected.not_to eq('Error') }
        end
      end
    end

    context "X-Winner" do
      context "when game_state determines X wins" do
        let(:input) { "x,x,x,o,o,x,o,x,o" }

        it { is_expected.to eq('X-Winner') }
      end

      context "when game_state determines X won multiple times" do
        let(:input) { "o,x,o,o,x,o,x,x,x" }

        it { is_expected.to eq('X-Winner') }
      end
    end

    context "O-Winner" do
      context "when game_state determines O wins" do
        let(:input) { "o,x,x,x,o,x,o,x,o" }

        it { is_expected.to eq('O-Winner') }
      end

      context "when game_state determines O won multiple times" do
        let(:input) { "o,o,o,x,o,x,o,x,x" }

        it { is_expected.to eq('O-Winner') }
      end
    end

    context "Incomplete" do
      context "when valid moves can be made without a determined winner" do
        let(:input) { "o,x,o,x,o,o,,,x" }

        it { is_expected.to eq('Incomplete') }
      end
    end

    context "Tie" do
      context "when all valid moves have been made with no winner" do
        let(:input) { "o,x,o,x,o,o,x,o,x" }

        it { is_expected.to eq('Tie') }
      end
    end
  end
end
