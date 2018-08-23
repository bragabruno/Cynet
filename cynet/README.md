cynet
=====

 **cynet is a spatial-temporal analysis library for inferrence of statistical causality**

**NOTE:** if issues arise with dependencies in python3, be sure that tkinter is installed  
if not, please run:


	sudo apt-get install python3-tk


**Usage:**


	from cynet import cynet
	from cynet.cynet import uNetworkModels as models
	from viscynet import viscynet as vcn


cynet module includes:  
-   cynet
-   viscynet
-   bokeh\_pipe

cynet library classes:
----------------------

-   spatioTemporal
-   uNetworkModels
-   simulateModels

**class spatioTemporal**  
Utilities for spatial-temporal analysis

**Attributes:**  

-   log\_store (Pickle): Pickle storage of class data & dataframes
-   log\_file (string): path to CSV of legacy dataframe
-   ts\_store (string): path to CSV containing most recent ts export
-   DATE (string):
-   EVENT (string): column label for category filter
-   coord1 (string): first coordinate level type; is column name
-   coord2 (string): second coordinate level type; is column name
-   coord3 (string): third coordinate level type; (z coordinate)
-   end\_date (datetime.date): upper bound of daterange
-   freq (string): timeseries increments; e.g. D for date
-   columns (list): list of column names to use; requires at least 2 coordinates and event type
-   types (list of strings): event type list of filters
-   value\_limits (tuple): boundaries (magnitude of event above threshold)
-   grid (dictionary or list of lists): coordinate dictionary with respective ranges and EPS value OR custom list of lists of custom grid tiles as [coord1\_start, coord1\_stop, coord2\_start, coord2\_stop]
-   grid\_type (string): parameter to determine if grid should be built up from a coordinate start/stop range ('auto') or be built from custom tile coordinates ('custom')
-   threshold (float): significance threshold

**Methods:**


	__init__(self, log_store='log.p', log_file=None, ts_store=None, DATE='Date', year=None, month=None, day=None, EVENT='Primary Type', coord1='Latitude', coord2='Longitude', coord3=None, init_date=None, end_date=None, freq=None, columns=None, types=None, value_limits=None, grid=None, threshold=None)}

	fit(self, grid=None, INIT=None, END=None, THRESHOLD=None,csvPREF='TS',auto_adjust_time=False,incr=6,max_incr=24):

	getTS(self, _types=None, tile=None, freq=None)

	get_rand_tile(tiles=None,LAT=None,LON=None,EPS=None,_types=None)

	get_opt_freq(df,incr=6,max_incr=24)
	
	getGrid(self)
	
	pull(self, domain='data.cityofchicago.org', dataset_id='crimes', token=None, store=True, out_fname='pull_df.p', pull_all=False)
	
	timeseries(self, LAT=None, LON=None, EPS=None,_types=None,CSVfile='TS.csv',THRESHOLD=None,tiles=None,incr=6,max_incr=24)
 