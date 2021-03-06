% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/download.R
\name{download_ERA}
\alias{download_ERA}
\title{Downloading ERA5(Land)-data from ECMWF servers}
\usage{
download_ERA(
  Variable = NULL,
  Type = "reanalysis",
  DataSet = "era5-land",
  DateStart = "1981-01-01",
  DateStop = Sys.Date() - 100,
  TResolution = "month",
  TStep = 1,
  Extent = extent(-180, 180, -90, 90),
  Dir = getwd(),
  FileName = NULL,
  API_User = NULL,
  API_Key = NULL
)
}
\arguments{
\item{Variable}{ERA5(Land)-contained climate variable. See 'donwload' output of Variable_List() for possible values.}

\item{Type}{Whether to download reanalysis ('reanalysis') or ensemble ('ensemble_members', 'ensemble_mean', or 'ensemble_spread') data. Only available for era5 data.}

\item{DataSet}{Which ERA5 data set to download data from. 'era5' or 'era5-land'.}

\item{DateStart}{Date ('YYYY-MM-DD') at which to start time series of downloaded data.}

\item{DateStop}{Date ('YYYY-MM-DD') at which to stop time series of downloaded data.}

\item{TResolution}{Temporal resolution of final product. 'hour', 'day', 'month', or 'year'.}

\item{TStep}{Which time steps (numeric) to consider for temporal resolution. For example, specify bi-monthly data records by setting TResolution to 'month' and TStep to 2.}

\item{Extent}{Optional, download data according to rectangular bounding box. specify as extent() object or as a raster or a SpatialPolygonsDataFrame object. If Extent is a SpatialPolygonsDataFrame, this will be treated as a shapefile and the output will be cropped and masked to this shapefile.}

\item{Dir}{Directory specifying where to download data to.}

\item{FileName}{A file name for the netcdf produced. Default is a combination parameters in the function call.}

\item{API_User}{ECMWF cds user number.}

\item{API_Key}{ECMWF cds API key.}
}
\value{
A raster object containing the downloaded ERA5(-Land) data, and a NETCDF (.nc) file in the specified directory.
}
\description{
This function breaks down download calls into monthly intervals, downloads ERA5(-Land) data from ECMWF servers according to user-specification, and fuses the downloaded files together according to user-demands. The actual time to download is dependent on ECMWF download queues. Users need an API key (https://cds.climate.copernicus.eu/api-how-to) to be set up.
}
\examples{
\dontrun{
# Downloading ERA5-Land air temperature reanalysis data in 12-hour intervals for the entire year of 2000 for Germany. API User and Key in this example are non-functional. Substitute with your user number and key to run this example.
download_ERA(Variable = '2m_temperature', Type = 'reanalysis', DataSet = 'era5-land', DateStart = '2000-01-01', DateStop = '2000-12-31', TResolution = 'hour', TStep = 12, Extent = extent(6,15,47,55), API_User = NULL, API_Key = NULL)
}

}
