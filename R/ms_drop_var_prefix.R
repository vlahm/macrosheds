#' Drop macrosheds variable prefixes
#'
#' Drop prefixes on macrosheds variables.
#'
#' @author Spencer Rhea, \email{spencerrhea41@gmail.com}
#' @author Mike Vlah
#' @author Wes Slaughter
#' @param x character string. Macrosheds variable with a prefix.
#' @return returns a character without the two character prefix on macrosheds 
#'    variable.
#' @details Macrosheds variables all have a two letter prefix on the front of the 
#'    variable to denote the sampling type. The first space is either a I for 'installed'
#'    or a G for 'grab.' Denoting if this variable records continuously or is a grab 
#'    sample. The second position is either a S for 'sensor' or N for 'not a sensor'.
#'    Non-sensor variables are generally analyzed in a laboratory. 
#' @export
#' @examples
#' macrosheds_vars <- c('GN_NO3_N', 'GN_Mg', 'IS_discharge')
#' macrosheds_vars <- drop_var_prefix(x = macrosheds_vars)

ms_drop_var_prefix <- function(x){
    
    unprefixed <- substr(x, 4, nchar(x))
    
    return(unprefixed)
}