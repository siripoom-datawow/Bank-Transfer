require './banktransfer.rb'

RSpec.describe BankTransfer do
  it "raise ArgrmentError when no transfer string data" do
    transaction1 = BankTransfer.new("",[])
    expect{transaction1.min_initial_amount}.to raise_error(ArgumentError,"No transaction data")
  end
  it "raise ArgrmentError when transaction and amount unmatch" do
    transaction2 = BankTransfer.new("ABAAB",[100,200])
    expect{transaction2.min_initial_amount}.to raise_error(ArgumentError,"invalid argument")
  end
  it "return [2,4] if transaction is 'BAABA' and amount is [2,4,1,1,2]" do
    transaction3 =  BankTransfer.new("BAABA", [2,4,1,1,2])
    expect(transaction3.min_initial_amount).to eq([2,4])
  end
  it "return [1000,2000] if transaction is 'ABABB' and amount is [3, 1, 2, 2, 4]" do
    transaction4 =  BankTransfer.new('ABABB', [3, 1, 2, 2, 4])
    expect(transaction4.min_initial_amount).to eq([2,4])
  end
end
