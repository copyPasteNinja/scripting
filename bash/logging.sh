#!/bin/bash

result="$(cat /var/log/httpd/access_log | tail -n 1 | awk -F " " '{print $1, $4,$5}')"

if [ $? -ne 0 ]; then 
	echo "Unusual Pattern Detected, for more info refer: /var/log/scripts/error_logs"
	echo $result >> /var/log/scripts/error_logs
	exit
fi

IP_ADDRESS=$(echo $result | awk -F " " '{print $1}')
DATE_TIME=$(echo $result | awk -F " " '{print $2,$3}')



htmlContent="""
<!DOCTYPE html>
<html>
<head>
<style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}
</style>
</head>
<body>

<h2>Abdul's Table</h2>

<table>
  <tr>
    <th>IP Address</th>
    <th>Date Time</th>
    <th>Log User</th>
  </tr>
  <tr>
    <td>$IP_ADDRESS</td>
    <td>$DATE_TIME</td>
    <td>$(whoami)</td>
  </tr>
</table>

</body>
</html>"""



echo $htmlContent > /var/www/html/index.html 
