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

    kits.(Manufacturer).(Cat).(Lot).Diam = Diams;
    kits.(Manufacturer).(Cat).(Lot).CV = CV;
    kits.(Manufacturer).(Cat).(Lot).BeadRI = BeadRI;
    kits.(Manufacturer).(Cat).(Lot).BeadRIWave = BeadRIWave;
    kits.(Manufacturer).(Cat).(Lot).SetName = SetName;
    kits.(Manufacturer).(Cat).(Lot).Composition = Composition;
    kits.(Manufacturer).(Cat).(Lot).SpikeInDiam = SpikeInDiam;
end

text = jsonencode(kits);

name = '../database/kitdatabase.json';
if isfile(name)
    delete(name)
end
fid = fopen(name,'w');
fprintf(fid, text);

