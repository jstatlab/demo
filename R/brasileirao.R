#' Encontrar pior ano de um time
#'
#' Usando a base de partidas do Brasileirao,
#' encontra o pior ano de um time ate o ano de 2022
#'
#' @param time chr Nome de um time do campeonato brasileiro.
#' @return tibble Uma tabela de uma linha.
#' @examples
#' encontrar_pior_ano_time("Santos")
#' encontrar_pior_ano_time("Sport")
#'
#' @export
encontrar_pior_ano_time <- function(time) {
  partidas_brasileirao |>
    dplyr::group_by(temporada, quem_ganhou) |>
    dplyr::filter(
      quem_ganhou != "Empate",
      quem_ganhou %in% time
    ) |>
    dplyr::count(quem_ganhou, sort = TRUE, name = "n_vitorias") |>
    dplyr::ungroup() |>
    dplyr::filter(n_vitorias == min(n_vitorias))
}
