module ChargesHelper
	
	def convert_to_pounds(payment_amount)
		number_to_currency((payment_amount.to_f / 100), unit: "£" )
	end
end
