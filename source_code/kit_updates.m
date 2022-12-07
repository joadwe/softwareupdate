clear; clc

% create online json lookup

% FCMPASS kit
Manufacturer = 'Company_Name';
Cat = 'C100001';
Lot = 'L202212';

kits.(Manufacturer).(Cat).(Lot).Diam = [81 100 152 240 303 401];
kits.(Manufacturer).(Cat).(Lot).CV = [12 6.8 3.3 1.5 1.6 1.3];
kits.(Manufacturer).(Cat).(Lot).BeadRI = repmat(1.59,1,6);
kits.(Manufacturer).(Cat).(Lot).BeadRIWave = repmat(589,1,6);
kits.(Manufacturer).(Cat).(Lot).SetName = 'FCMPASS Bead Kit';
kits.(Manufacturer).(Cat).(Lot).Composition = repmat({'Polystyrene'},1,6);
kits.(Manufacturer).(Cat).(Lot).SpikeInDiam = [220]; 


text = jsonencode(kits);

name = '../database/kitdatabase.json';
fid = fopen(name,'w');
fprintf(fid, text);

