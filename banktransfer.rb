class BankTransfer
  def initialize (transaction,amount)
    @transaction = transaction.upcase
    @amount = amount.dup
  end
  def min_initial_amount
    raise ArgumentError, "No transaction data"  if @transaction.empty?
      raise ArgumentError, "invalid argument"  if @transaction.length != @amount.length
    sum_a = 0
    sum_b = 0
    result_a = 0
    result_b = 0
    @transaction.split('').each_with_index do |t,index|
      case t
      when "B"
        sum_a -= @amount[index]
        sum_b += @amount[index]
        unless sum_a > 0
          result_a -= sum_a
          sum_a = 0
        end
      when "A"
        sum_b -= @amount[index]
        sum_a += @amount[index]
        unless sum_b > 0
          result_b -= sum_b
          sum_b = 0
        end
      end
    end
    [result_a,result_b]
  end
end

# test =  BankTransfer.new('ABABB', [3, 1, 2, 2, 4])
# puts test.min_initial_amount.inspect
