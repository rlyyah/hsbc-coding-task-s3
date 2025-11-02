# Coding Task S3

![Language](https://img.shields.io/badge/language-Q-lightgrey.svg)

---

## Table of Contents
- [0.5. Excercise one](#0.5-excercise-one)
- [1. Input File](#1-input-file)
- [2. Functions: VWAP & TWAP](#2-functions-vwap--twap)
- [3. Running the Q Process](#3-running-the-q-process)
- [4. Examples](#4-examples)
- [5. Tests](#5-tests)
- [6. Requirements](#6-requirements)
- [7. License](#7-license)

---

## 0.5. Excercise one

```
exc_one/excercise_one.q
```

Description:

Create a vector of times in ascending order: the vector should have the current time plus increments of 2 seconds. Then pick and arbitrary time t* find its position in the vector adjust the vector to contain only elements greater or equal to t including t itself.

* arbiraty time t is randomly chosen from the existing vector
** there is a previous version in which t is being provided. I wasn't sure which one proper but at least I find this version much cleaner.

---

## 1. Input File

The generated CSV data file is located at:

```
exc_two/data/fx_data.csv
```

This file contains **100,000 transactions** and 6 columns:

- **`date`** – randomly generated date of the transaction, between `2025.06.01` and `2025.07.01`.
- **`time`** – randomly generated time of the transaction, between `00:00:00` and `23:59:59`.
- **`slug`** – of the form `ABC/PQR`, where `ABC` and `PQR` are ISO 4217 currency codes.  
  *Example*: If `slug = PLN/USD` and `fx = USD`, then `1 PLN = px USD`.
- **`fx`** – currency type, chosen randomly from `EUR`, `USD`, `GBP`, `ALL`.
- **`size`** – randomly generated transaction size.
- **`px`** – randomly generated unit price of the transaction.

For more information, see:

```
exc_two/generate_csv.q
```

---

## 2. Functions: VWAP & TWAP

The file with VWAP and TWAP functions:

```
exc_two/calculations.q
```

- **`calculate_vwap`** – calculates VWAP for a given time range and list of symbols.
- **`calculate_twap`** – calculates TWAP for a given time range and list of symbols.

---

## 3. Running the Q Process

To start a **q** process and load the functions:

1. Navigate to the project root folder:
   ```bash
   cd hsbc-coding-task-s3-master
   ```

2. **Run exercise 2:**

  Base version:
   ```bash
   q main.q -exc 2 -dates <start_date> <end_date> -curr <curr1> <curr2> <curr3> <curr4>
   ```
   Example:
   ```bash
   q main.q -exc 2 -dates 2025.06.01 2025.06.15 -curr EUR USD GBP ALL
   ```
  Interval version:
   ```bash
   q main.q -exc 2 -dates <start_date> <end_date> -curr <curr1> <curr2> <curr3> <curr4>  -int <interval_value>
   ```
   Example:
   ```bash
   q main.q -exc 2 -dates 2025.06.01 2025.06.15 -curr EUR USD GBP ALL -int 1
   ```

---

## 4. Examples

- **Exercise 2:**
  ```bash
  q main.q -exc 2 -dates 2025.06.01 2025.06.15 -curr EUR USD GBP ALL
  ```
- **Exercise 2 with intervals:**
   ```bash
   q main.q -exc 2 -dates 2025.06.01 2025.06.15 -curr EUR USD GBP ALL -int 1
   ```
---

## 5. Tests

Test scripts are located in:

```
tests.q
```

To run tests:
```bash
q tests.q
```

---

## 6. Requirements

- **q language environment** (tested with version = 4.1).
- A Unix-like environment or Windows with q installed.
- Generated `fx_data.csv` file (created with `generate_csv.q`):
  ```bash
  q exc_two/generate_csv.q
  ```

---

