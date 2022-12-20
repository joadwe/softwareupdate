clear; clc

% create online json lookup

kits = readtable('/Users/welshjoa/Documents/MATLAB/Software Updates/database/beadkits.xlsx');

for i = 1:size(kits, 1)
    % FCMPASS kit
    Manufacturer = kits.Manufacturer{i};
    Cat =  kits.Cat{i};
    Lot =  kits.Lot{i};
    Diams =  str2num(kits.Diam{i});
    CV =  str2num(kits.CV{i});
    BeadRI =  str2num(kits.BeadRI{i});
    BeadRIWave =  str2num(kits.BeadRIWave{i});
    SetName = kits.SetName;
    Composition = kits.Composition;
    SpikeInDiam = kits.SpikeInDiam;

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

