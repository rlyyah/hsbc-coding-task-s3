// This code is part of a Q script that calculates TWAP and VWAP for given currencies over a specified date range.
// It reads data from a CSV file and processes it to compute the required metrics.
calculate_vwap: {
    [time_range_list; fx_list; data_table]
    vwap: select (sum px*size) % (sum size) by fx from (select from data_table where (date >= time_range_list[0] and date <= time_range_list[1]) and fx in fx_list);
    vwap};

calculate_twap: {
    [time_range_list; fx_list; data_table]
    twap: select avg px4 by fx from (select min px, max px, first px, last px, (min px + max px + first px + last px)%4 by date, fx from data_table where (date >= time_range_list[0] and date <= time_range_list[1]) and fx in fx_list);
    twap};

// Handling input arguments TODO: this should be moved to the main.q file
args: .Q.opt .z.x;
//$[null args[`dates][0]; starting_date: select min date from fx_table; starting_date: "D"$args[`dates][0]];
//$[null args[`dates][1]; ending_date: select max date from fx_table; ending_date: "D"$args[`dates][1]];
//$[null args[`curr]; currencies: `EUR`GBP`USD`ALL; currencies: `$args[`curr]];
starting_date: "D"$args[`dates][0];
ending_date: "D"$args[`dates][1];
time_range:(starting_date; ending_date);
currencies: `$args[`curr];

// read data
fx_table: ("DVSSIF"; enlist",") 0: `:/data/fx_data.csv; 

twap_result: calculate_twap[time_range; currencies; fx_table];
vwap_result: calculate_vwap[time_range; currencies; fx_table];

show "Dates and curriences:";
show time_range;
show currencies
show "TWAP Result:";
show twap_result;
show "--------------------";
show "VWAP Result:";
show vwap_result
show "--------------------";

