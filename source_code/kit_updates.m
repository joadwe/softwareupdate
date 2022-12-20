clear; clc

% create online json lookup

kits = readtable('/Users/welshjoa/Documents/MATLAB/Software Updates/database/beadkits.xlsx');

for i = 1:size(kits, 1)
    % FCMPASS kit
    Manufacturer = kits{i,'Manufacturer'}{1};
    Cat =  kits{i,'Cat'}{1};
    Lot =  kits{i,'Lot'}{1};
    Diams =  str2num(kits{i,'Diam'}{1});
    CV =  str2num(kits{i,'CV'}{1});
    BeadRI =  str2num(kits{i,'BeadRI'}{1});
    BeadRIWave =  str2num(kits{i,'BeadRIWave'}{1});
    SetName = kits{i,'SetName'}{1};
    Composition = kits{i,'Composition'};
    SpikeInDiam = kits{i,'SpikeInDiam'};

    database.(Manufacturer).(Cat).(Lot).Diam = Diams;
    database.(Manufacturer).(Cat).(Lot).CV = CV;
    database.(Manufacturer).(Cat).(Lot).BeadRI = BeadRI;
    database.(Manufacturer).(Cat).(Lot).BeadRIWave = BeadRIWave;
    database.(Manufacturer).(Cat).(Lot).SetName = SetName;
    database.(Manufacturer).(Cat).(Lot).Composition = Composition;
    database.(Manufacturer).(Cat).(Lot).SpikeInDiam = SpikeInDiam;
end

text = jsonencode(database);

name = '../database/kitdatabase.json';
if isfile(name)
    delete(name)
end
fid = fopen(name,'w');
fprintf(fid, text);

