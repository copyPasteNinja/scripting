#!/bin/bash

name=$1
age=$2
city=$3

if [ $age -gt 18 ]; then
        eligible="Yes" 
else
        eligible="No"
fi


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

<h2>Shirin's Table</h2>

<table>
  <tr>
    <th>Name</th>
    <th>Age</th>
    <th>City</th>
    <th>Eligible To Vote</th>
  </tr>
  <tr>
    <td>$name</td>
    <td>$age</td>
    <td>$city</td>
    <td>$eligible</td>
  </tr>
</table>

</body>
</html>"""


echo $htmlContent > /var/www/html/index.html
