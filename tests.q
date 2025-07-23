// Functions should be taken from another file, there is still so much to learn :D 
calculate_vwap: {
    [time_range_list; fx_list; data_table]
    vwap: select (sum px*size) % (sum size) by fx from (select from data_table where date within time_range_list, fx in fx_list);
    vwap};

calculate_twap: {
    [time_range_list; fx_list; data_table]
    twap: select avg px4 by fx from (select min px, max px, first px, last px, (min px + max px + first px + last px)%4 by date, fx from data_table where date within time_range_list, fx in fx_list);
    twap};

// read data
data_table: ("DVSSIF"; enlist",") 0: `:/data/fx_data.csv; 

test_vwap:();

time_range_list:(2025.06.10; 2025.06.20);
fx_list: `EUR`USD`GBP`ALL;

test_vwap: test_vwap,(count calculate_vwap[time_range_list; fx_list; data_table]) = 4;

time_range_list:(2025.06.10; 2025.06.20);
fx_list: `EUR`USD`GBP;

test_vwap: test_vwap,(count calculate_vwap[time_range_list; fx_list; data_table]) = 3;

time_range_list:(2025.06.10; 2025.06.20);
fx_list: `EUR`USD;

test_vwap: test_vwap,(count calculate_vwap[time_range_list; fx_list; data_table]) = 2;

time_range_list:(2025.06.10; 2025.06.20);
fx_list: `EUR;
test_vwap: test_vwap,(count calculate_vwap[time_range_list; fx_list; data_table]) = 1;

time_range_list:(2025.06.10; 2025.06.20);
fx_list: `KAPPA;
test_vwap: test_vwap,(count calculate_vwap[time_range_list; fx_list; data_table]) = 0;

time_range_list:(2025.06.10; 2025.06.20);
fx_list: `;
test_vwap: test_vwap,(count calculate_vwap[time_range_list; fx_list; data_table]) = 0;

time_range_list:(2020.01.01; 2020.01.01);
fx_list: `USD;
test_vwap: test_vwap,(count calculate_vwap[time_range_list; fx_list; data_table]) = 0;

time_range_list:(2020.06.01; 2020.05.01);
fx_list: `USD;
test_vwap: test_vwap,(count calculate_vwap[time_range_list; fx_list; data_table]) = 0;

time_range_list:(2025.06.01; 2025.06.01);
fx_list: `USD;
test_vwap: test_vwap,abs((calculate_vwap[time_range_list; fx_list; data_table][`USD][`px] - 0.2664507)) < 0.0000001;

time_range_list:(2025.06.01; 2025.06.01);
fx_list: `ALL;
test_vwap: test_vwap,abs((calculate_vwap[time_range_list; fx_list; data_table][`ALL][`px] - 23.35117)) < 0.0000001;

passed_percent:(100*(sum test_vwap)%(count test_vwap));
passed_percent: string passed_percent;
show "VWAMP test:";
show "test taken:", string count test_vwap;
show "test passed:",passed_percent,"%";

test_twap:();

time_range_list:(2025.06.10; 2025.06.20);
fx_list: `EUR`USD`GBP`ALL;

test_twap: test_twap,(count calculate_twap[time_range_list; fx_list; data_table]) = 4;

time_range_list:(2025.06.10; 2025.06.20);
fx_list: `EUR`USD`GBP;

test_twap: test_twap,(count calculate_twap[time_range_list; fx_list; data_table]) = 3;

time_range_list:(2025.06.10; 2025.06.20);
fx_list: `EUR`USD;

test_twap: test_twap,(count calculate_twap[time_range_list; fx_list; data_table]) = 2;

time_range_list:(2025.06.10; 2025.06.20);
fx_list: `EUR;
test_twap: test_twap,(count calculate_twap[time_range_list; fx_list; data_table]) = 1;

time_range_list:(2025.06.10; 2025.06.20);
fx_list: `KAPPA;
test_twap: test_twap,(count calculate_twap[time_range_list; fx_list; data_table]) = 0;

time_range_list:(2025.06.10; 2025.06.20);
fx_list: `;
test_twap: test_twap,(count calculate_twap[time_range_list; fx_list; data_table]) = 0;

time_range_list:(2020.01.01; 2020.01.01);
fx_list: `USD;
test_twap: test_twap,(count calculate_twap[time_range_list; fx_list; data_table]) = 0;

time_range_list:(2020.06.01; 2020.05.01);
fx_list: `USD;
test_twap: test_twap,(count calculate_twap[time_range_list; fx_list; data_table]) = 0;

time_range_list:(2025.06.01; 2025.06.01);
fx_list: `USD;
test_twap: test_twap,abs((calculate_twap[time_range_list; fx_list; data_table][`USD][`px4] - 0.2694741)) < 0.0000001;

time_range_list:(2025.06.01; 2025.06.20);
fx_list: `ALL;
test_twap: test_twap,abs((calculate_twap[time_range_list; fx_list; data_table][`ALL][`px] - 23.36703)) < 0.0000001;

passed_percent:(100*(sum test_twap)%(count test_twap));
passed_percent: string passed_percent;
show "TWAP test:";
show "test taken:", string count test_twap;
show "test passed:",passed_percent,"%";