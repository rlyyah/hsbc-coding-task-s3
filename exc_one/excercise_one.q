show "start at: ";
show .z.p;
show "----------"

exc_one_func_bis: {
    [args_list] 
    time_sec:18h$.z.t; 
    $[null args_list[0]; till_value:`int$ floor (2+24:00:00-time_sec)%2; till_value:args_list[0]]; 
    secs_list: time_sec + 2 * til till_value; 
    $[null args_list[1]; t:(time_sec + 1?24:00:00-time_sec)[0]; t:args_list[1]]; 
    t_pos:(where t = secs_list)[0]; 
    sliced_list:secs_list[t_pos+ til (count secs_list) - t_pos]; 
    sliced_list};
result: exc_one_func_bis[(0N; 0Nv)];
show result;

show "finish at: ";
show .z.p;
show "----------"

// TODO:
// what about providing t
// what about providing til_number
// what if t is not a second
// what if til is lower than 