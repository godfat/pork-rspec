
require 'pork-rspec/test'

describe 'mocks' do
  describe 'allow' do
    title = "The RSpec Book"

    let(:book) { double("book") }

    after do
      expect(book.title).to eq(title)
      expect(book.reverse).to eq(title.reverse)
    end

    it 'receives with a block' do
      allow(book).to receive(:title) { title }
      allow(book).to receive(:reverse) { title.reverse }
    end

    it 'receives with and_return' do
      allow(book).to receive(:title).and_return(title)
      allow(book).to receive(:reverse).and_return(title.reverse)
    end

    it 'receive_messages' do
      allow(book).to receive_messages(:title => title,
                                      :reverse => title.reverse)

    end

    context 'just use double' do
      let(:book) { double("book", :title => title,
                                  :reverse => title.reverse) }

      it{}
    end
  end
end
