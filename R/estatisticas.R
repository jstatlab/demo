#' Calcular estatisticas do dataset gapminder
#'
#' Calcular estatisticas baseadas no continente e periodo escolhido
#'
#' @param data Dados
#' @param continentes Continentes a serem avaliados
#' @param anos Periodo a ser avaliado
#'
#' @return Estatisticas baseadas no continente e periodo escolhido
calcular_estatisticas <- function(data, continentes, anos = 2000) {
  data |>
    dplyr::filter(continente %in% continentes, ano >= anos) |>
    dplyr::group_by(ano) |>
    dplyr::summarise(
      pop = sum(populacao) / 1e6,
      vida = mean(expectativa_de_vida),
      .groups = "drop"
    )
}


#' Calcular estatisticas do dataset gapminder
#'
#' Calcular estatisticas baseadas no continente e periodo escolhido
#'
#' @param continentes Continentes a serem avaliados
#' @param anos Periodo a ser avaliado
#'
#' @return Estatisticas baseadas no continente e periodo escolhido
#'
#' @examples
#' calcular_estatisticas_gapminder("Europa", 2000)
#' @export
calcular_estatisticas_gapminder <- function(continentes, anos = 2000) {
  dados::dados_gapminder |>
    calcular_estatisticas(continentes, anos)
}
