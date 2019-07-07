#!/bin/bash

start_date=`date -d "20200101" +%d-%b-%y`
end_date=`date -d "$start_date - 1 year" +%d-%b-%y`
kill_date=`date -d "20080101" +%d-%b-%y`
export es_idx_date=`date -d "$end_date" +%Y%m`

while [ "$start_date" != "$kill_date" ]; do
	echo $start_date and $end_date and $es_idx_date
	export start_date=`date -d "$end_date" +%d-%b-%y`
	export end_date=`date -d "$end_date - 6 months" +%d-%b-%y`
	export es_idx_date=`date -d "$end_date - 1 month" +%Y%m`

done

