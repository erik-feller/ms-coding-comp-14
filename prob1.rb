#Problem 1. Input txt file, output txt file. 

inputf = ARGV.first
filein = open(inputf)

#Read file in as lines
lines = filein.readlines

#read the info line
info = lines[0].split(' ')

#delete the info line. we don't want it anymore
lines.delete_at(0)

#Now a for loop to go through all of the remaining lines and parse into a 2x matrix
size = 0
lines.each do |i|
	size = size+1
end
eles = lines
elei = [[3,2,1]]
for i in 0...size do
	eles[i] = lines[i].split(' ')
	j = 0
	while j < 3
		(eles[i])[j] = (eles[i])[j].to_i #convert those strings to ints
		j = 1+j
	end
end


