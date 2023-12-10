## code to prepare `partidas_brasileirao` dataset goes here
## Esse arquivo não fará parte do build do pacote, portanto é uma
## sandbox do pacote

library(tidyverse)

# partidas_brasileirao <- "https://git.io/JOqUN" |> read_csv2()
partidas_brasileirao <-
  "data-raw/dados-brutos/partidas_brasileirao.csv" |>
  read_csv2()

usethis::use_data(partidas_brasileirao, overwrite = TRUE)
