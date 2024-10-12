#!/bin/bash 

TableRow="""
<tr>
    <th>IP Address</th>
    <th>Date Time</th>
    <th>Log User</th>
</tr>
"""

file="/var/log/httpd/access_log"

while read -r line; do 
    IP_ADDRESS=$(echo $line | awk -F " " '{print $1}')
    DATE_TIME=$(echo $line | awk -F " " '{print $4, $5}')
    USER=$(whoami)

    TableRow+="""<tr>
    <td>$IP_ADDRESS</td>
    <td>$DATE_TIME</td>
    <td>$USER</td>
  </tr>
"""
done < "$file"

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
    $TableRow
</table>

</body>
</html>"""

echo "$htmlContent" > /var/www/html/index.html