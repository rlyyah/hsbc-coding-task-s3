system "l ./exc_two/calculations.q";

args: .Q.opt .z.x;

starting_date: "D"$args[`dates][0];
ending_date: "D"$args[`dates][1];
time_range:(starting_date; ending_date);
currencies: `$args[`curr];

vwap_result: calculate_vwap[time_range;currencies];
twap_result: calculate_twap[time_range;currencies];

// Display the results
show "--------------------";
show "Dates and curriences:";
show time_range;
show currencies;
show "--------------------";
show "VWAP Result:";
show vwap_result
show "--------------------";
show "TWAP Result:";
show twap_result;
show "--------------------";

$[null "J"$args[`int][0]; exit 0; interval: "J"$args[`int][0]]

days:{x+interval}\[7h$(floor (ending_date-starting_date)%interval);(starting_date;starting_date)]
currencies_scan:{x}\[7h$(floor (ending_date-starting_date)%interval);currencies]

vwap_result_interval: calculate_vwap'[days;currencies_scan];

result_dict:currencies!flip {x'[currencies][`px]} each vwap_result_interval;
dates: starting_date + interval * til floor ((ending_date-starting_date)%interval)+1
table: ([] dates:dates)^flip result_dict;

save `:output_data/table.csv 

exit 0;



