function [ model, lb, ub ,names] = set_model_and_bound(name_model)
names = {};
switch(name_model)
    case ('Fouquet')
        model = @FouquetModel;
        ub = [0.5   0.5  10    1   1  10 ];
        lb = zeros(1,length(ub));
        names = {'Romega','Rct','Q','phi','Rd','tauD'};
    case ('FouquetL')
        model = @FouquetL;
        ub = [0.5   0.5  10    1   1  10 10];
        lb = zeros(1,length(ub));
        names = {'Romega','Rct','Q','phi','Rd','tauD','L'};
    case ('FouquetRC')
        model = @Fouquet_RC_Model;
        ub = [0.5   0.5  10    1   1  10   1   10];
        lb = zeros(1,length(ub));
        names = {'Romega','Rct','Q','phi','Rd','tauD','R','C'};
    case ('FouquetRCPE')
        model = @Fouquet_RCPE_Model;
        ub = [1   1  10    1   1  10   1   10  1];
        lb = zeros(1,length(ub));
    case ('FouquetRWar')
        model = @Fouquet_RWar_Model;
        ub = [1   1  10    1   1  10   1   1  10];
        lb = zeros(1,length(ub));
    case ('CompleteAnodeCathode')
        model = @DissociatedElectrodesModelsComplete;
        ub = [10   1   1   1   10   1   10     1   1   1   10];
        lb = zeros(1,length(ub));
    case ('SimplifiedAnodeCathode')
        model = @DissociatedElectrodesModelsSimplified;
        ub = [10   1   1   10    1   1   1   10];
        lb = zeros(1,length(ub));
    case ('Dhirde')
        model = @DhirdeModel;
        ub = [1   1   1   10  10    1    1   1   10  10];
        lb = zeros(1,length(ub));
        names = {'Romega','Rct1','Rct2','Q1','Q2','phi1','phi2','Rd','tauD','L'};
    case ('DhirdeSimple')
        model = @DhirdeSimple;
        ub = [1   1      10      1      1   10  10 10];
        lb = zeros(1,length(ub));
        names = {'Romega','Rct1','Q1','phi1','Rd','tauD','Llf','Lhf'};
    case ('DhirdeL')
        model = @DhirdeL;
        ub = [1   1      10      1      1   10  10  10 1 10 1];
        lb = zeros(1,length(ub));
        names = {'Romega','Rct1','Q1','phi1','Rd','tauD','Llf','Lhf','Rct2','Q2','phi2'};
    case ('DhirdeLWARL')
        model = @DhirdeLWARL;
        ub = [1   1      10    1   1   10  10  10 1 10 1 1  10  10];
        lb = zeros(1,length(ub));
        names = {'Romega','Rct1','Q1','phi1','Rd1','tauD1','Llf1','Lhf','Rct2','Q2','phi2','Rd2','tauD2','Llf2'};
    case ('DhirdeLWAR')
        model = @DhirdeLWAR;
        ub = [1   1   1   10  10    1    1   1   10  10  10  1  10 ];
        lb = [0   0   0   0   0   0   0   0   0.1   0  0   0   0 ];
        names = {'Romega','Rct1','Rct2','Q1','Q2','phi1','phi2','Rd1','tauD1','Lhf','Llf','Rd2','tauD2'};
    case ('DhirdeLCPE')
        model = @DhirdeLCPE;
        ub = [1   1   1   10  10    1    1   1   10  10  10  10  1  1];
        lb = [0   0   0   0   0   0   0   0   0.1   0  0   0   0   0];
    case ('DhirdeLCPEWARL')
        model = @DhirdeLCPEWARL;
        ub = [1   1   1   10  10    1    1   1   10  10  10  10  1  1  1   10  10];
        lb = [0   0   0   0   0   0   0   0   0.1   0  0   0   0   0   0   0   0];
        names = {'Romega','Rct1','Rct2','Q1','Q2','phi1','phi2','Rd1','tauD1','Lhf','Llf','Q3','phi3','R','Rd2','tauD2','L'};
    case ('DhirdeLCPECPE')
        model = @DhirdeLCPECPE;
        ub = [1   1   1   10  10    1    1   1   10  10  10  10  1  1  10  1  1];
        lb = [0   0   0   0   0   0   0   0   0.1   0  0   0   0   0   0   0   0];
        
    case ('DhirdeC')
        model = @Dhirde_C_Model;
        ub = [1   1   1   10   1   1   10  10  10];
        lb = zeros(1,length(ub));
        names = {'Romega','Rct1','Rct2','Q','phi','Rd','tauD','L','C'};
    case ('DhirdeCL')
        model = @DhirdeCL;
        ub = [1   1   1   10   1   1   10  10  10 10];
        lb = zeros(1,length(ub));
        names = {'Romega','Rct1','Rct2','Q','phi','Rd','tauD','Lhf','Llf','C'};
    case ('Asghari')
        model = @AsghariModel;
        ub = [1   1   1   10  10    1    1   10 ];
        lb = zeros(1,length(ub));
    case ('AsghariWar')
        model = @AsghariModel_War_Model;
        ub = [1   1   1   10  10    1    1   10   1  10 ];
        lb = zeros(1,length(ub));
    case ('R4C3')
        model = @R4C3Model;
        ub = [1   1   1   1   10   10   10 ];
        lb = zeros(1,length(ub));
    case ('LLFin')
        model = @LLFinModel;
        ub = [1   1   10   1   1   10   10 ];
        lb = zeros(1,length(ub));
    case ('LLFout')
        model = @LLFoutModel;
        ub = [1   1   10   1   1   10   10 ];
        lb = zeros(1,length(ub));
end

