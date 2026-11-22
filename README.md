# stock-beta-analysis

Stock beta vs the S&P 500, calculated in R (dplyr) and Python.

> 🚧 Work in progress

## What it does

For a universe of S&P 500 stocks, compute each stock's **beta** against the index
and find the stocks with the highest market sensitivity.

$$\beta_i = \frac{\mathrm{Cov}(R_i, R_m)}{\mathrm{Var}(R_m)}$$

## Project structure

```
R/
  01_load_to_duckdb.R   # one-time: raw prices -> DuckDB
  02_compute_beta.R     # beta calculation and chart
python/                 # same analysis in Python (planned)
tests/                  # checks against hand-calculated values
```

## Setup

1. Copy `.Renviron.example` to `.Renviron` and set the paths to your data.
2. Restart R, then run the scripts in `R/` in order.

Data is not included in this repository.
