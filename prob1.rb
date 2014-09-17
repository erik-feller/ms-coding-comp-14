#Problem 1. Input txt file, output txt file. 

inputf = ARGV.first
filein = open(inputf)

def nxtflr(elevators, floor, path, offlist, cost, iterationctr, size)
	minid = nil
	curmin = 999999999;
	for i in 0...size do
		if (elevators[i][3] < curmin) && (elevators[i][2] == floor)
			curmin = elevators[i][3]
			minid = i
		end
	end
	if elevators[minid][1] == 0
		path[iterationctr] = minid
		if !elevators[minid][4]
			offlist[iterationctr] = minid
		end
		cost += elevators[minid][3]
		return
	else
		path[iterationctr] = minid
		if !elevators[minid][4]
			offlist[iterationctr] = minid
		end
		cost += elevators[minid][3]
		iterationctr += 1
		nxtflr(elevators,elevators[minid][1],path,offlist, cost, iterationctr,size)
	end

end

#Read file in as lines
lines = filein.readlines
#read the info line
info = lines[0].split(' ')
size = info[3].to_i
dest = info[0].to_i
espd = info[1].to_i
sspd = info[2].to_i

#delete the info line. we don't want it anymore
lines.delete_at(0)

#Now a for loop to go through all of the remaining lines and parse into a 2x matrix
eles = lines
for i in 0...size do
	eles[i] = lines[i].split(' ')
	j = 0
	while j < 3
		(eles[i])[j] = (eles[i])[j].to_i #convert those strings to ints
		j = 1+j
	end
	if ((eles[i][1]-eles[i][2]).abs)*sspd < espd
		eles[i][3] = ((eles[i][1]-eles[i][2]).abs)*sspd
		eles[i][4] = nil
	else
		eles[i][3] = espd
		eles[i][4] = true
	end
end

#Now iterate through and follow the shortest path
len = 0
currfloor = dest
stopped = []
mincost = 999999
bestpath = []
bestcost = 0
iterations = 0

nxtflr(eles,dest,bestpath,stopped,bestcost,iterations,size)

