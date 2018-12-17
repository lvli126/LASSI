%param.E=Emat_xyt(kdata(:,:,:,1)~=0,b1);
%param.d=kdata;
%M=param.E'*param.d;
M=LplusScopy;
[nx,ny,nt]=size(M);
M=reshape(M,[nx*ny,nt]);
[L,S,d,b,stats]=LASSI(M, 1.2,0.01,0.5,'soft');
LplusS=L+S;
L=reshape(L,[nx,ny,nt]);
S=reshape(S,[nx,ny,nt]);
LplusS=reshape(LplusS,[nx,ny,nt]);
% display 4 frames
LplusSd=LplusS(33:96,33:96,2);LplusSd=cat(2,LplusSd,LplusS(33:96,33:96,8));LplusSd=cat(2,LplusSd,LplusS(33:96,33:96,14));LplusSd=cat(2,LplusSd,LplusS(33:96,33:96,24));
Ld=L(33:96,33:96,2);Ld=cat(2,Ld,L(33:96,33:96,8));Ld=cat(2,Ld,L(33:96,33:96,14));Ld=cat(2,Ld,L(33:96,33:96,24));
Sd=S(33:96,33:96,2);Sd=cat(2,Sd,S(33:96,33:96,8));Sd=cat(2,Sd,S(33:96,33:96,14));Sd=cat(2,Sd,S(33:96,33:96,24));

figure;
subplot(3,1,1),imshow(abs(LplusSd),[0,1]);ylabel('L+S')
subplot(3,1,2),imshow(abs(Ld),[0,1]);ylabel('L')
subplot(3,1,3),imshow(abs(Sd),[0,1]);ylabel('S')