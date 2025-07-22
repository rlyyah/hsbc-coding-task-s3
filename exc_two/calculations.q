// read data
fx_table: ("DVSSIF"; enlist",") 0: `:/data/fx_data.csv; 

show `table,`info;
show 5#fx_table;
show count fx_table;

calculate_vwap: {
    [time_rage; fx_list; data_table]
    vwap: select (sum px*size) % (sum size) by fx from (select from data_table where (date >= time_rage[0] and date <= time_rage[1]) and fx in fx_list);
    vwap};

vwap_result: calculate_vwap[(2025.06.01; 2025.06.30); (`EUR`GBP); fx_table];
show vwap_result;

calculate_twap: {
    [time_rage; fx_list; data_table]
    twap: select avg px4 by fx from (select min px, max px, first px, last px, (min px + max px + first px + last px)%4 by date, fx from data_table where (date >= time_rage[0] and date <= time_rage[1]) and fx in fx_list);
    twap};

twap_result: calculate_twap[(2025.06.01; 2025.06.30); (`EUR`GBP); fx_table];
show twap_result;