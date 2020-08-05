function circle = m_circulo(radio)

circle = zeros(radio, radio)

x = [1:radio]
y = floor(sqrt(radio^2 - x.^2))

ids = x * radio + y

circle(ids) = 1

circle = [rot90(circle); circle]
circle = [rot90(rot90(circle)) circle]

end