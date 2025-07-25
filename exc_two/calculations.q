// read data
fx_table: ("DVSSIF"; enlist",") 0: `:/data/fx_data.csv; 

// This code is part of a Q script that calculates TWAP and VWAP for given currencies over a specified date range.
// It reads data from a CSV file and processes it to compute the required metrics.
calculate_vwap: {
    [time_range_list; fx_list]
    vwap: select (sum px*size) % (sum size) by fx from (select from fx_table where date within time_range_list, fx in fx_list);
    vwap};

calculate_twap: {
    [time_range_list; fx_list]
    twap: select avg px by fx from (select (min px + max px + first px + last px)%4 by date, fx from fx_table where date within time_range_list, fx in fx_list);
    twap};
