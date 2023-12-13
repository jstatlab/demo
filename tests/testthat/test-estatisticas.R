# test_that("multiplication works", {
#   expect_equal(2 * 2, 4)
# })

test_that("calcular_estatisticas works with gapminder", {

  expect_equal(
    nrow(calcular_estatisticas_gapminder("Europa")),
    2
  )

  expect_equal(
    nrow(calcular_estatisticas_gapminder("Ásia")),
    2
  )

  # greater than (>=): gt
  expect_gt(
    calcular_estatisticas_gapminder("Ásia")$vida[1],
    69.2
  )

  # less than (<=): lt
  expect_lt(
    calcular_estatisticas_gapminder("Ásia")$vida[1],
    69.3
  )

  expect_type(
    calcular_estatisticas_gapminder("Ásia")$vida[1],
    "double"
  )

})

test_that("calcular_estatisticas works with another table", {
  df <- dados::dados_gapminder |> dplyr::filter(ano >= 2004)

  df |> calcular_estatisticas(df, "Europa")

  expect_equal(
    nrow(calcular_estatisticas(df, "Europa")),
    1
  )

  expect_equal(
    ncol(calcular_estatisticas(df, "Europa")),
    3
  )

})












