fim = false
count = 0
string = "<<.<<..>><>><.>.>.<<.>.<.>>>><>><>>"
string.gsub!('.','')

while !fim
  if  string.include?("<>") then
      string.slice!('<>')
    count +=1
    p string
    else
      fim = true
    end
end

puts count
