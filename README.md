
1. An input file with data you have created in csv format

Generated data has been saved in:
./exc_two/data/fx_data.csv

Generated consists of 100000 transactions and 6 columns: 
- date: randomly generated date of the transation starting from 2025.06.01 and finishing on 2025.07.01,
- time: randomly generated time of the transaction starting from 00:00:00 and finishing on 23:59:59, 
- slug: column is of form "ABC/PQR" where ABC and PQR are standard active currency codes as of ISO 4217. currency contains a currency code which is the unit of the value in the tables. For example, if slug is PLN/USD and fx is USD, it means that 1 pln = px USD. Mapped based on randomly generated vector with 4 values.
- fx: currency available EUR, USD, GPB and ALL. Mapped based on randomly generated vector with 4 values.
- size: randomly generated size of transaction.  
- px: randomly generated unit price of transaction.

For more information head to the ./exc_two/generate_csv.q file.

2. A function which, given a time range and a list of symbols as inputs, returns the
VWAP (TWAP) for each of these symbols as a table

Functions are located in the ./exc_two/calculations.q file as "calculate_vwap" and "calculate_twap".

3. A command to start a q process which will load this function.

- Locate youself in the same folder as the main.q script (which is located in the main folder "coding-task-s3");
- To run excercise one function use:
"q ./main.q -exc 1 -time provided_time" 
(example: "q ./main.q -exc 1 -time 20:00:00")
- To run excercise two function use:
"q ./main.q -exc 2 -dates starting_date ending_date -curr curr1 curr2 curr3 curr4" 

4. Example of how to call the function

- excercise 1 example:
"q ./main.q -exc 1 -time 20:00:00"

- excercise 2 example: 
"q ./main.q -exc 2 -dates 2025.06.01 2025.06.15 -curr EUR USD GBP ALL"

5. Test(s) to ensure validity of code
Tests are located in the ./tests.q file.
to run tests use:
"q ./tests.q"