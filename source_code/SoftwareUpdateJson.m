clear; clc

% create online json lookup

% FCMPASS metadata
software.FCMPASS.version = "3.9";
software.FCMPASS.updatedate = "2021-06-21";
software.FCMPASS.url = "https://nano.ccr.cancer.gov/fcmpass/";

% MPAPASS metadata
software.MPAPASS.version = "1.0.1";
software.FCMPASS.updatedate = "2020-10-06";
software.MPAPASS.url = "https://nano.ccr.cancer.gov/mpapass/";

% RPSPASS metadata
software.RPSPASS.version = "1.0.1";
software.FCMPASS.updatedate = "2022-04-01";
software.RPSPASS.url = "https://nano.ccr.cancer.gov/rpspass/";

% PhiAlign metadata
software.PhiAlign.version = "1.0.1";
software.PhiAlign.updatedate = "2022-12-06";
software.PhiAlign.url = "";


text = jsonencode(software);

name = '../Database/database.json';
fid = fopen(name,'w');
fprintf(fid, text);

