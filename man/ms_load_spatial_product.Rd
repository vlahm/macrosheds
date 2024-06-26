% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ms_load_spatial_product.R
\name{ms_load_spatial_product}
\alias{ms_load_spatial_product}
\title{Read MacroSheds spatial data products from disk into R.}
\usage{
ms_load_spatial_product(
  macrosheds_root,
  spatial_product,
  networks,
  domains,
  site_codes
)
}
\arguments{
\item{macrosheds_root}{character. The path to the macrosheds dataset's parent
directory, established with \code{\link[=ms_download_core_data]{ms_download_core_data()}}.}

\item{spatial_product}{character. Either "ws_boundary" for watershed boundary,
"stream_gauge_locations", or "precip_gauge_locations". Files associated with this
product will be combined across specified networks/domains.}

\item{networks}{character vector. MacroSheds networks to load; optional. Omit networks, domains, and site_codes to load all. To see a catalog of
networks, use ms_load_sites(), visit macrosheds.org, or see \href{https://portal.edirepository.org/nis/mapbrowse?scope=edi&identifier=1262}{MacroSheds EDI}}

\item{domains}{character vector. MacroSheds domains to load; optional. Omit networks, domains, and site_codes to load all. To see a catalog of
networks, use ms_load_sites(), visit macrosheds.org, or see \href{https://portal.edirepository.org/nis/mapbrowse?scope=edi&identifier=1262}{MacroSheds EDI}}

\item{site_codes}{character vector. MacroSheds networks to load; optional. Omit networks, domains, and site_codes to load all. To see a catalog of
networks, use ms_load_sites(), visit macrosheds.org, or see \href{https://portal.edirepository.org/nis/mapbrowse?scope=edi&identifier=1262}{MacroSheds EDI}}
}
\value{
returns an \code{sf} object containing all data belonging to the
selected spatial product in the \code{macrosheds_root} directory.
}
\description{
Load a macrosheds spatial product (ws_boundary, precip_gauge_locations,
or stream_gauge_locations) from a downloaded MacroSheds dataset. See
\code{\link[=ms_load_product]{ms_load_product()}} for time-series data.
}
\examples{
ms_root = 'data/macrosheds'
dir.create(ms_root, recursive = TRUE)
ms_download_core_data(macrosheds_root = ms_root,
                      domains = c('niwot', 'hjandrews', 'hbef'))
macrosheds_data <- load_spatial_product(macrosheds_root = ms_root, 
                                        spatial_product = 'ws_boundary'
                                        domains = 'hbef')
}
\seealso{
\code{\link[=ms_download_core_data]{ms_download_core_data()}}, \code{\link[=ms_load_product]{ms_load_product()}}, \code{\link[=ms_load_variables]{ms_load_variables()}}, \code{\link[=ms_load_sites]{ms_load_sites()}}
}
\author{
Spencer Rhea

Mike Vlah, \email{vlahm13@gmail.com}

Wes Slaughter
}
