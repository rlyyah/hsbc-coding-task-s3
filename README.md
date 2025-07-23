# Coding Task S3

![Language](https://img.shields.io/badge/language-Q-lightgrey.svg)
![License](https://img.shields.io/badge/license-MIT-blue.svg)

---

## Table of Contents
- [1. Input File](#1-input-file)
- [2. Functions: VWAP & TWAP](#2-functions-vwap--twap)
- [3. Running the Q Process](#3-running-the-q-process)
- [4. Examples](#4-examples)
- [5. Tests](#5-tests)
- [6. Requirements](#6-requirements)
- [7. License](#7-license)

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

2. **Run exercise 1:**
   ```bash
   q main.q -exc 1 -time <provided_time>
   ```
   Example:
   ```bash
   q main.q -exc 1 -time 20:00:00
   ```

3. **Run exercise 2:**
   ```bash
   q main.q -exc 2 -dates <start_date> <end_date> -curr <curr1> <curr2> <curr3> <curr4>
   ```
   Example:
   ```bash
   q main.q -exc 2 -dates 2025.06.01 2025.06.15 -curr EUR USD GBP ALL
   ```

---

## 4. Examples

- **Exercise 1:**
  ```bash
  q main.q -exc 1 -time 20:00:00
  ```

- **Exercise 2:**
  ```bash
  q main.q -exc 2 -dates 2025.06.01 2025.06.15 -curr EUR USD GBP ALL
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

- **q language environment** (tested with version >= 4.x).
- A Unix-like environment or Windows with q installed.
- Generated `fx_data.csv` file (created with `generate_csv.q`):
  ```bash
  q exc_two/generate_csv.q
  ```

---

