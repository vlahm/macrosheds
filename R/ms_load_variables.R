#' load MacroSheds variables data table
#'
#' Load a data.frame of MacroSheds variables with information on variable codes,
#' units, and more. Visit [EDI](https://portal.edirepository.org/nis/mapbrowse?scope=edi&identifier=1262) for complete metadata.
#'
#' @author Wes Slaughter, \email{weston.slaughter@duke.edu}
#' @author Mike Vlah, \email{vlahm13@@gmail.com}
#' @author Spencer Rhea
#' @param var_set character. One of "timeseries", "timeseries_by_site", or "ws_attr".
#'    If "timeseries", basic metadata for core MacroSheds time series variables will be returned. If "timeseries_by_site", a
#'    more complete catalog of variable availability per site will be returned. If "ws_attr", metadata for MacroSheds watershed
#'    attributes will be returned.
#' @return returns a \code{data.frame} of variables, codes, units, and other metadata.
#' @details Variable metadata are included as an .RData file with the macrosheds package, and
#'    are loaded into the macrosheds namespace on library(macrosheds). This
#'    function simply retrieves a data.frame from the macrosheds namespace and makes it available
#'    in the global environment.
#' @export
#' @seealso [ms_load_sites()], [ms_load_spatial_product()], [ms_load_product()]
#' @examples
#' ws_attr_vars <- ms_load_variables(var_set = 'ws_attr')

ms_load_variables <- function(var_set = 'timeseries'){

    library("dplyr", quietly = TRUE)

    opts <- c('timeseries', 'timeseries_by_site', 'ws_attr')
    if(! var_set %in% opts){
        stop(paste('var_set must be one of', paste(opts, collapse = ', ')))
    }

    requireNamespace('macrosheds', quietly = TRUE)
    
    if(var_set == 'timeseries'){
        return(dplyr::select(macrosheds::ms_vars_ts, -molecule))
    } else if(var_set == 'ws_attr'){
        return(macrosheds::ms_vars_ws)
    } else {
        return(macrosheds::ms_var_catalog)
    }
}
