a = (ones(2,2) .* 6)
b = [8 15; 8 15]
c = (ones(2,2) .* 5)

A = [ (c .* 3 + 3) b a]
B = [ (c .* 3) (ones(2,2) .* 2) c]

C = [ (ones(1,2) .* 20) [1 12] ( ones(1,2) .* 7) ]
D = [ a (b - 5) (c + 3) ]

X = [ A(1,:); B; A(2,:)]
X = [ X; C ]
X = [ X; D ]