require_relative '../lib/content_chooser.rb'
require 'rspec/autorun'

describe ContentChooser do
  # NOTE: Here is a list of users and the contents they have received already.
  let(:users) {
    [
      { name: 'Steve', received_contents: ['1a', '1b', '3c'] },
      { name: 'Virginie', received_contents: ['3a', '2b', '3c'] },
      { name: 'Fiona', received_contents: ['1b', '2a', '3b'] },
      { name: 'Jenny', received_contents: ['3b', '2c', '1b'] },
      { name: 'James', received_contents: ['2b', '1b', '3a'] },
      { name: 'Fede', received_contents: ['2c', '3a', '1c'] },
      { name: 'Sara', received_contents: ['3a', '2c', '3b'] },
      { name: 'Tizi', received_contents: ['2b', '1b', '2a'] },
      { name: 'Thomas', received_contents: ['3c', '2b', '1a'] },
    ]
  }

  # NOTE: These are the box codes for the next shipment and their contents
  let(:box_codes) {
    [
      { code: 'gr1', contents: ['1a', '1b'], type: :petite },
      { code: 'gr2', contents: ['1a', '2b'], type: :petite },
      { code: 'gr3', contents: ['1b', '2c'], type: :petite },
      { code: 'gr4', contents: ['2c', '3c'], type: :petite },
      { code: 'gr5', contents: ['3b', '1c'], type: :petite },
    ]
  }

  let(:user_results) {
     [
      { name: 'Steve', available_boxes: ['gr5'] },
      { name: 'Virginie', available_boxes: ['gr1', 'gr3', 'gr5'] },
      { name: 'Fiona', available_boxes: ['gr2', 'gr4'] },
      { name: 'Jenny', available_boxes: ['gr2'] },
      { name: 'James', available_boxes: ['gr4', 'gr5'] },
      { name: 'Fede', available_boxes: ['gr1', 'gr2'] },
      { name: 'Sara', available_boxes: ['gr1', 'gr2'] },
      { name: 'Tizi', available_boxes: ['gr4', 'gr5'] },
      { name: 'Thomas', available_boxes: ['gr3', 'gr5'] },
    ]
  }

  # NOTE: Create a class that accepts the list of users and returns a list of
  # users and the box codes they can receive without getting the same contents again.

  subject { ContentChooser.new(box_codes).call(users) }

  describe '#call' do
    it 'returns an array' do
      expect(subject).to be_kind_of Array
    end

    it 'returns an array of hashes' do
      expect(subject.first).to be_kind_of Hash
    end

    it 'returns the correct values' do
      expect(subject).to match_array user_results
    end
  end
end
