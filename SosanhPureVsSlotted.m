%Throughput Curve Generate for Slotted and Pure Aloha

G = 0:0.25:5;
S = G.*exp(-G);
plot(G,S,'b.-');

title('So sanh Slotted & Pure Aloha');
xlabel('Load Offered');
ylabel('Throughput');
text(1,.38,'Max Throughput for Slotted Aloha');

hold on;

S1 = G.*exp(-2*G);
plot(G,S1,'r.-');
text(.5,.2,'Max Throughput for Pure Aloha');
legend('Slotted Aloha','Pure Aloha','Location','NorthEastOutside');
grid;