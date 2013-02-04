ctmc
// Volume Plasma
const int VP = 1000;
// Volume Fegato
const int VF = 800;
// Colorante iniziale
const int IC = 500;

module BSF
Pl : [0..VP] init IC;
Fe : [0..VF] init 0;

[t1] Pl > 0 & Fe < VF -> Pl / VP : (Pl'=Pl-1) & (Fe'=Fe+1);
[t2] Fe > 0 & Pl < VP -> Fe / VF : (Pl'=Pl+1) & (Fe'=Fe-1);
[t3] Fe > 0 -> Fe / VF : (Fe'=Fe-1);

endmodule


//base rates

const double r1=0.454;
const double r2=0.698;
const double r3=0.432;


module base_rate 
[t1] true  -> r1 : true;
[t2] true  -> r2 : true;
[t3] true  -> r3 : true;
endmodule