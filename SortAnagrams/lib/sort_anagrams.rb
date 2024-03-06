###
# DESCRIPTION
# Given an array of strings strs, group the anagrams together. You can return the answer in any order.
# An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.
# Input: strs = ["eat","tea","tan","ate","nat","bat"]
# Output: [["bat"],["nat","tan"],["ate","eat","tea"]]
###

class SortAnagrams
  def sort_anagrams(str_array)
    sorted_hash = {}

    str_array.each do |string|
      # Sort string to use as a key for matching anagrams
      sorted_string = string.split('').sort.join

      sorted_hash[sorted_string] = [] unless sorted_hash[sorted_string]

      sorted_hash[sorted_string] << string
    end

    sorted_hash.map{ |key, sub_arrays| sub_arrays }
  end
end
