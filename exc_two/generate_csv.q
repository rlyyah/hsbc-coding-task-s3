rows_amt: 1000000;

dates: 2025.06.01+rows_amt?31;
show min dates;
show max dates;

times: rows_amt?24:00:00;
show min times;
show max times;

sizes: 100*1+rows_amt?100;
show min sizes;
show max sizes;

ixs: rows_amt?4;
show ixs;
fxs:`EUR`USD`GBP`ALL ixs;
show fxs;
slugs: `PLNEUR`PLNUSD`PLNGBP`PLNALL ixs;
show slugs;

pxs: (1+rows_amt?.05) * 0.2300 0.2600 0.2000 22.7800 ixs;

show pxs;

fx_data: ([] date:dates;
    time:times;
    slug:slugs;
    fx:fxs;
    size:sizes;    
    px:pxs);

fx_data:`date`time xasc fx_data;

show fx_data;

save `:/data/fx_data.csv 