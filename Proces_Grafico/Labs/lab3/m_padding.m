function y = m_padding(x,iii,jjj)


[r_i, r_j] = size(x);
alt_r_i = floor((iii - r_i) / 2);
alt_r_j = floor((jjj - r_j) / 2);
y = [zeros(r_i, alt_r_j) x zeros(r_i, alt_r_j)];
y = [zeros(alt_r_i, jjj); y; zeros(alt_r_i, jjj)];

end