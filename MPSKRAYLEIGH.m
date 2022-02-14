% Chuong trinh mo phong truyen dan M-PSK qua kenh Pha-dinh
% Tao data va Dieu che
M=8; %8-PSK
bk = randn(1, [8 - 1]);
Es = Eb * log2(M);
theta = 2 * pi/M * bk + pi/M;
A = sqrt(Es);
sk = A * exp(j * theta)
% Tao kenh pha-dinh
s=1-2*(rand(1,sigLen)>=0.5);
% Tinh toan nang luong bit tin hieu Eb
Eb=norm(s)^2/sigLen;
% Mat do pho AWGN
No=Eb./EbNo;
% Vong lap tinh toan BER theo Eb/No
for k=1:length(EbNo)
% Tao AWGN
n=sqrt(No(k)./2).*(randn(1,sigLen)+j*randn(1,sigLen));
% Tin hieu thu
y=s+n;
% Tach tin hieu
shat=sign(real(y));
error=s-shat;
noError=length(find(error~=0));
kappa = log(2*M);
BER = biterr(bk, kappa);
end
% BER ly thuyet cua truyen dan M-PSK qua kenh pha-dinh
BERtheory=1/2*erfc(sqrt(EbNo));
% Ve do thi
semilogy(EbNodB,BER,'*',EbNodB,BERtheory)
xlabel('Eb/No')
ylabel('BER')
legend('By simulation’,’By theory')
title('BER cua M-PSK qua kenh pha-dinh')
grid