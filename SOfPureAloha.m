%Throughput Curve Generate for Slotted and Pure Aloha

G = 0:0.25:5;
S = G.*exp(-2*G);
plot(G,S,'r.-');

title('Thong luong S of Pure Aloha');
xlabel('Load Offered');
ylabel('Throughput');
text(.5,.06,'Throughput for Pure Aloha');
legend('Pure Aloha','Location','NorthEastOutside');