system "l ./exc_two/calculations.q";

test_vwap:();

time_range_list:(2025.06.10; 2025.06.20);
fx_list: `EUR`USD`GBP`ALL;
result: calculate_vwap[time_range_list; fx_list];
test_vwap: test_vwap, (count result) = 4;

time_range_list:(2025.06.10; 2025.06.20);
fx_list: `EUR`USD`GBP;
result: calculate_vwap[time_range_list; fx_list];

test_vwap: test_vwap, (count result) = 3;

time_range_list:(2025.06.10; 2025.06.20);
fx_list: `EUR`USD;
result: calculate_vwap[time_range_list; fx_list];
test_vwap: test_vwap, (count result) = 2;

time_range_list:(2025.06.10; 2025.06.20);
fx_list: `EUR;
result: calculate_vwap[time_range_list; fx_list];
test_vwap: test_vwap, (count result) = 1;

time_range_list:(2025.06.10; 2025.06.20);
fx_list: `KAPPA;
result: calculate_vwap[time_range_list; fx_list];
test_vwap: test_vwap, (count result) = 0;

time_range_list:(2025.06.10; 2025.06.20);
fx_list: `;
result: calculate_vwap[time_range_list; fx_list];
test_vwap: test_vwap, (count result) = 0;

time_range_list:(2020.01.01; 2020.01.01);
fx_list: `USD;
result: calculate_vwap[time_range_list; fx_list];
test_vwap: test_vwap, (count result) = 0;

time_range_list:(2020.06.01; 2020.05.01);
fx_list: `USD;
result: calculate_vwap[time_range_list; fx_list];
test_vwap: test_vwap, (count result) = 0;

passed_percent:(100*(sum test_vwap)%(count test_vwap));
passed_percent: string passed_percent;
show "VWAMP test:";
show "test taken:", string count test_vwap;
show "test passed:",passed_percent,"%";

test_twap:();

time_range_list:(2025.06.10; 2025.06.20);
fx_list: `EUR`USD`GBP`ALL;
result: calculate_twap[time_range_list; fx_list];
test_twap: test_twap, (count result) = 4;

time_range_list:(2025.06.10; 2025.06.20);
fx_list: `EUR`USD`GBP;
result: calculate_twap[time_range_list; fx_list];
test_twap: test_twap, (count result) = 3;

time_range_list:(2025.06.10; 2025.06.20);
fx_list: `EUR`USD;
result: calculate_twap[time_range_list; fx_list];
test_twap: test_twap, (count result) = 2;

time_range_list:(2025.06.10; 2025.06.20);
fx_list: `EUR;
result: calculate_twap[time_range_list; fx_list];
test_twap: test_twap, (count result) = 1;

time_range_list:(2025.06.10; 2025.06.20);
fx_list: `KAPPA;
result: calculate_twap[time_range_list; fx_list];
test_twap: test_twap, (count result) = 0;

time_range_list:(2025.06.10; 2025.06.20);
fx_list: `;
result: calculate_twap[time_range_list; fx_list];
test_twap: test_twap, (count result) = 0;

time_range_list:(2020.01.01; 2020.01.01);
fx_list: `USD;
result: calculate_twap[time_range_list; fx_list];
test_twap: test_twap, (count result) = 0;

time_range_list:(2020.06.01; 2020.05.01);
fx_list: `USD;
result: calculate_twap[time_range_list; fx_list];
test_twap: test_twap, (count result) = 0;

passed_percent:(100*(sum test_twap)%(count test_twap));
passed_percent: string passed_percent;
show "TWAP test:";
show "test taken:", string count test_twap;
show "test passed:",passed_percent,"%";

exit 0;
