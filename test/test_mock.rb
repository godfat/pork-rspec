
require 'pork-rspec/test'

describe 'mocks' do
  %w[allow expect].each do |kind|
    describe kind do
      title = "The RSpec Book"

      let(:book) { double("book") }

      after do
        expect(book.title).to eq(title)
        expect(book.reverse).to eq(title.reverse)

        if kind == 'expect'
          if Object.const_defined?(:Muack)
            expect{ book.title }.to raise_error(Muack::Expected)
          end
        else
          expect(book.title).to eq(title)
        end
      end

      it 'receives with a block' do
        send(kind, book).to receive(:title) { title }
        send(kind, book).to receive(:reverse) { title.reverse }
      end

      it 'receives with and_return' do
        send(kind, book).to receive(:title).and_return(title)
        send(kind, book).to receive(:reverse).and_return(title.reverse)
      end

      it 'receive_messages' do
        send(kind, book).to receive_messages(:title => title,
                                             :reverse => title.reverse)
      end

      context 'just use double' do
        let(:book) { double("book", :title => title,
                                    :reverse => title.reverse) }

        it{}
      end if kind == 'allow'

      context 'unnamed defs' do
        let(:book) { double(:title => title, :reverse => title.reverse) }

        it{}
      end if kind == 'allow'
    end
  end

  describe 'and_return with multiple values' do
    let(:die) { double('die') }

    it do
      allow(die).to receive(:roll).and_return(1, 2, 3)
      [1, 2, 3, 3, 3].each do |result|
        expect(die.roll).to eq(result)
      end
    end
  end
end
