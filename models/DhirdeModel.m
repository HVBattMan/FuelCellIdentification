function [ impedance_spectrum_points ] = DhirdeModel( params, frequencies )

%                   CPE 1              CPE 2
%               _____\\______      _____\\_____       __/warburg/__
%     Romega   |     //     |     |     //     |     |             |  
% ___/\/\/\____|            |-----|            |-----|             |  
%              |___/\/\/\___|     |___/\/\/\___|     |____OOOOO____|
%                   Rct 1              Rct 2                L

 Romega = params(1);
 Rct1 = params(2);
 Rct2 = params(3);
 Q1 = params(4);
 Q2 = params(5);
 phi1 = params(6);
 phi2 = params(7);
 Rd = params(8);
 tauD = params(9);
 L = params(10);
 
 puls = 2 * pi .* frequencies;
 
 rad = sqrt(1i.*puls*tauD);
 war = Rd .* tanh(rad)./rad;

 CPE1 = Q1 .* (1i.* puls).^phi1;
 CPE2 = Q2 .* (1i.* puls).^phi2;
 
 ZRomega = Romega + 0.*puls;
 ZRct1 = Rct1 + 0.*puls;
 ZRct2 = Rct2 + 0.*puls;
 ZL = (1i*puls*L);
 Zcpe1 = 1./CPE1;
 Zcpe2 = 1./CPE2;

 Zpar1 = (Zcpe1.*ZRct1)./(Zcpe1+ZRct1);
 Zpar2 = (Zcpe2.*ZRct2)./(Zcpe2+ZRct2);
 Zpar3 = (ZL.*war)./(ZL+war);
 impedance_spectrum_points = ZRomega + Zpar1+ Zpar2+ Zpar3;
end

