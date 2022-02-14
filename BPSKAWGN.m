% Chuong trinh mo phong truyen dan BPSK qua kenh AWGN
% Dinh nghia tham so
EbNodB=0:10;
EbNo=10.^(EbNodB./10);
sigLen=5*10^5;
% Tao tin hieu BPSK {+1,-1}
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
BER(k)=noError/sigLen;
end
% BER ly thuyet cua truyen dan BPSK qua kenh AWGN
BERtheory=1/2*erfc(sqrt(EbNo));
% Ve do thi
semilogy(EbNodB,BER,'*',EbNodB,BERtheory)
xlabel('Eb/No')
ylabel('BER')
legend('By simulation’,’By theory')
title('BER cua BPSK qua kenh AWGN')
grid