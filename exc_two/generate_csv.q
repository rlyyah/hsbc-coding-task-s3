rows_amt: 1000000;

dates: 2025.06.01+rows_amt?31;
times: rows_amt?24:00:00;
sizes: 100*1+rows_amt?100;
ixs: rows_amt?4;
fxs:`EUR`USD`GBP`ALL ixs;
slugs: `PLNEUR`PLNUSD`PLNGBP`PLNALL ixs;
pxs: (1+rows_amt?.05) * 0.2300 0.2600 0.2000 22.7800 ixs;

fx_data: ([] date:dates;
    time:times;
    slug:slugs;
    fx:fxs;
    size:sizes;    
    px:pxs);

fx_data:`date`time xasc fx_data;

save `:/data/fx_data.csv 