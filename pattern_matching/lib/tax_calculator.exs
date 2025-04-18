Code.require_file("pattern_matching/lib/income_tax.ex")
user_input = IO.gets("Enter your salary:\n")
result = case Integer.parse(user_input) do
  :error -> "Input is not a number: #{user_input}"
  {salary, _} when salary >= 0 -> "Income Tax: #{IncomeTax.for(salary)}\nNet Salary: #{salary - IncomeTax.for(salary)}"
  {_,_} -> "You're paying"
end
IO.puts(result)
