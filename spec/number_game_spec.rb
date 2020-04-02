require_relative '../number_game'

RSpec.describe NumberGame do
  describe '.next_largest_number' do
    context 'with non numeric integer number' do
      context 'of type float' do
        it 'raises error' do
          expect do
            described_class.next_largest_number(123.5)
          end.to raise_error "Not a valid integer value."
        end
      end

      context 'of type string' do
        it 'raises error' do
          expect do
            described_class.next_largest_number("123")
          end.to raise_error "Not a valid integer value."
        end
      end
    end

    context 'with single digit number' do
      it 'raises error' do
        expect do
          described_class.next_largest_number(9)
        end.to raise_error "The number doesn't have enough digits to find next largest number."
      end
    end

    context 'with two digits number' do
      context 'digits are different' do
        it 'gives next largest number' do
          expect(described_class.next_largest_number(12)).to eq 21

          expect(described_class.next_largest_number(38)).to eq 83
        end

        context 'could not find next largest number' do
          it 'raises error' do
            expect do
              described_class.next_largest_number(21)
            end.to raise_error "Cannot have next larger number for 21" 
          end
        end
      end

      context 'same digits' do
        it 'raises error' do
          expect do
            described_class.next_largest_number(33)
          end.to raise_error "Cannot have next larger number for 33"
        end
      end
    end

    context 'more than two digits' do
      context 'different digits' do
        it 'returns 132 for 123' do
          expect(described_class.next_largest_number(123)).to eq 132
        end

        it 'returns 213 for 132' do
          expect(described_class.next_largest_number(132)).to eq 213
        end

        it 'returns 231 for 213' do
          expect(described_class.next_largest_number(213)).to eq 231
        end

        it 'returns 312 for 231' do
          expect(described_class.next_largest_number(231)).to eq 312
        end

        it 'returns 321 for 312' do
          expect(described_class.next_largest_number(312)).to eq 321
        end
      
        it 'returns 12354 for 12345' do
          expect(described_class.next_largest_number(12345)).to eq 12354
        end

        it 'returns 38627 for 38276' do
          expect(described_class.next_largest_number(38276)).to eq 38627
        end

        context 'could not find next largest number' do
          it 'raises error' do
            expect do
              described_class.next_largest_number(321)
            end.to raise_error "Cannot have next larger number for 321" 
          end
        end
      end

      context 'some digits occurs multiple times' do
        it 'returns 211 for 121' do
          expect(described_class.next_largest_number(121)).to eq 211
        end

        it 'returns 212 for 122' do
          expect(described_class.next_largest_number(122)).to eq 212
        end

        it 'returns 221 for 212' do
          expect(described_class.next_largest_number(212)).to eq 221
        end

        it 'returns 1585861179 for 1585819761' do
          expect(described_class.next_largest_number(1585819761)).to eq 1585861179
        end
      end

      context 'same digits' do
        it 'raises error' do
          expect do
            described_class.next_largest_number(3333)
          end.to raise_error "Cannot have next larger number for 3333"
        end
      end
    end
  end
end
