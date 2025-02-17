Linux Date formatter :

|    Format Specifier   |  Description  | Example Output |
| ------------- | ------------- | ------------- |  
|%Y	|Year(4 digits)|	2024|
|%y	|Year(2 digits)|	24 |
|%m	|Month(01-12)|	10 (October)|
|%d	|Day of the month(01-31)|	05|
|%H	|Hour (00-23, 24-hour clock)|	14 (2 PM)|
|%I	|Hour (01-12, 12-hour clock)|	02 (2 PM)|
|%M	|Minute (00-59)|	30|
|%S	|Second (00-59)	|45|
|%p	|AM or PM |PM|
|%A	|Full weekday name|	Saturday |
|%a	|Abbreviated weekday name	|Sat|
|%B	|Full month name	| October|
|%b	|Abbreviated month name|	Oct|
|%Z	|Timezone name	|UTC, PST|
|%z	|Timezone offset from UTC	|+0530|
|%T	|Time (HH:MM)	|14:30:45|
|%F	|Full date (YYYY-MM-DD)	|2024-10-05|
|%D	|Date (MM/DD/YY)	|10/05/24|
|%R	|Time (HH)	|14:30|
|%r	|12-hour time (HH:MMAM/PM)	|02:30:45 PM|
|%s	|Seconds since Unix Epoch	|1733455845|
|%j	|Day of the year (001-366)	|279|
|%V	|ISO week number (01-53)	|40|
|%u	|Day of the week (1-7, 1=Monday)	|6 (Saturday)|


Common Redirection Operators:

|Operator| Description |
| ------------- | ------------- |
|>	        |Redirect standard output (overwrite)|
|>>	        |Redirect standard output (append)|
|2>	        |Redirect standard error|
|2>>	    |Append standard error|
|&>	        |Redirect both output and error (overwrite)|
|>&	        |Redirect both output and error (alternative)|
|<	        |Redirect standard input from a file|
|/dev/null	|Discard output or error|