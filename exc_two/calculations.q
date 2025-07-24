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

\p 4242

 
//t:{x+1}\[30;2025.06.01 2025.06.01]

//r:calculate_vwap'[t;`USD];
//show r;
//vals: {x[`USD][`px]} each r;
//show vals;



// Handling input arguments TODO: this should be moved to the main.q file
//args: .Q.opt .z.x;
//$[(count args[`dates]) = 0;starting_date: (select min date from fx_table)[`date][0] ;$[(count args[`dates][0]) <> 10; starting_date: (select min date from fx_table)[`date][0]; starting_date: "D"$args[`dates][0]]];
//$[(count args[`dates]) < 2;ending_date: (select max date from fx_table)[`date][0] ;$[(count args[`dates][1]) <> 10; ending_date: (select max date from fx_table)[`date][0]; ending_date: "D"$args[`dates][1]]];
//time_range:(starting_date; ending_date);
//currencies: `$args[`curr];

// Calculate TWAP and VWAP for the specified date range and currencies
//twap_result: calculate_twap[time_range; currencies; fx_table];
//vwap_result: calculate_vwap[time_range; currencies; fx_table];

// Display the results
//show "--------------------";
//show "Dates and curriences:";
//show time_range;
//show currencies
//show "--------------------";
//show "TWAP Result:";
//show twap_result;
//show "--------------------";
//show "VWAP Result:";
//show vwap_result
//show "--------------------";

