<7php include " .. /inc/dbinfo.inc"; ?>
<html>
<body>
<h1>Sample page</h1>
<7php

/* Connect to MySQL and select the database. */
$connection = mysqli_connect(DB_SERVER, DB_USERNAME, DB_PASSWORD);
if (mysqli_connect_erro()) echo "Failed to connect to MySQL: ". mysqli_connect_error();
$database = mysqli_select_db($connection, DB_DATABASE);
/* Ensure that the EMPLOYEES table exists. */
VerifyEmployeesTable($connection, DB_DATABASE);
/* If input fields are populated, add a row to the EMPLOYEES table. */
$employee_name = htmlentities($_POST['NAME']);
$employee_address = htmlentities($_POST['ADDRESS']);
if (strlen($employee_name) || strien($employee_address)) {
AddEmployee($connection, $employee_name, $employee_address);

<!-- Input form -- >
<form action=" <? PHP echo $_SERVER['SCRIPT_NAME'] ?>" method="POST'>
<table border="0">
<tr>
<td>NAME</td>
<td>ADDRESS</td>
</tr>
ctra
<td>
<input type="text" name="NAME" maxlength="45" size="30" />
</td>
<td>
<input type="text" name="ADDRESS" maxlength="90" size="60" />
</td>
<td:
<input type="submit" value="Add Data" />
</td>

</table>
</form>

<!-- Display table data. -- >
<table border="1" cellpadding="2" cellspacing="2">
<td>ID</td>
<td>NAME</td>
<td>ADDRESS</td>

<? php
$result = mysqli_query($connection, "SELECT * FROM EMPLOYEES");
while($query_data = mysqli_fetch_row($result)) <
echo "<tr>";
echo "<td>",$query_data[0], "</td>",
*< td>",$query_data[1], "</td>"
"<td>",$query_data[2], "</td>";
echo "</tr>";
}
?>
</table>

<|- Clean up. -- >
<7php

mysqli_free_result($result);
mysqli_close($connection);

</body>
</html>

<7php
/* Add an employee to the table. */
function AddEmployee($connection, $name, $address) <
$n = mysqli_real_escape_string($connection, Sname);
$a = mysqli_real_escape_string($connection, $address);
$query = "INSERT INTO EMPLOYEES (NAME, ADDRESS) VALUES ('$n', '$a');";
if(Imysqli_query($connection, $query)) echo("<p>Error adding employee data, </p>");

/* Check whether the table exists and, if not, create it. */
function VerifyEmployeesTable(Sconnection, $dbName) <
if(ITableExists("EMPLOYEES", $connection, $dbName))
Squery = "CREATE TABLE EMPLOYEES (
ID int(11) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
NAME VARCHAR(45),
ADDRESS VARCHAR(90)

if(Imysqli_query($connection, $query)) echo("<p>Error creating table .< /p>");

/* Check for the existence of a table. */
function TableExists($tableName, $connection, $dbName) {
$t = mysqli_real_escape_string($connection, $tableName);
$d = mysqli_real_escape_string($connection, $dbName);
$checktable = mysli_query($connection,
"SELECT TABLE_NAME FROM information_schema. TABLES WHERE TABLE_NAME = "$t' AND
TABLE_SCHEMA = '$d");
if(mysqli_num_rows($checktable) > 0) retumn true;
return false;
}
?>
