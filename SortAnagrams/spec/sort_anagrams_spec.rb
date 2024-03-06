require 'sort_anagrams'

RSpec.describe SortAnagrams do
  describe '#sort_anagrams' do
    let(:subject) { SortAnagrams.new.sort_anagrams(input) }

    context 'example a' do
      let(:input) { ["eat","tea","tan","ate","nat","bat"] }
      # let(:output) { [["bat"],["nat","tan"],["ate","eat","tea"]] }
      let(:output) { [["bat"],["tan","nat"],["eat","tea","ate"]] }

      # it { is_expected.to contain_exactly(contain_exactly(['bat']),
      #                                     contain_exactly(['nat','tan']),
      #                                     contain_exactly(['ate', 'eat', 'tea'])) }

      it { is_expected.to contain_exactly(*output) }
    end
  end
end
