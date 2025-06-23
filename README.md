<h2>📫 001-Harbour-MiniGUI-openConnection-TMySQLServer</h2>


 💞️💞️💞️<span class="font-weight-bold">Prepare | Download | Action</span>💞️💞️💞️
<br>
<br><span class="font-weight-bold">download xampp for windows: </span>
<i>	
<a href="https://www.apachefriends.org/download.html">https://www.apachefriends.org/download.html</a>
<br>🌱🌱🌱<br>
</i>
<pre>
phpMyAdmin edit:
c:\xampp\phpMyAdmin\config.inc.php

/* Authentication type and info */
$cfg['Servers'][$i]['auth_type'] = 'config';
$cfg['Servers'][$i]['user'] = 'root';
$cfg['Servers'][$i]['password'] = '';
$cfg['Servers'][$i]['extension'] = 'mysqli';
$cfg['Servers'][$i]['AllowNoPassword'] = true;
$cfg['Lang'] = '';

ceate empty database:
database-1:	mcg_db (utf8mb4_general_ci)
database-2:	laravel (utf8mb4_general_ci)

user: root (optional for demo)
pass: <empty> (optional for demo)

Create table and insert data:
-open phpmyadmin
-select mcg_db database
-click tab SQL
-open with your editor file: tblAbsenceType.sql
-copy and paste to phpmyadmin-SQL
-click GO

</pre>

<br>
<br><span class="font-weight-bold">visit to: </span>
<i>	
<a href="https://www.hmgextended.com/download.html">https://www.hmgextended.com/download.html</a>
<br>🌱🌱🌱<br>
</i>
<pre>
download Current version Harbour+MiniGUI
--> hmg-25.06-setup.zip
install at: c:\MiniGUI
if exist c:\MiniGUI --> rename first to c:\MiniGUI-old

download Borland C++ Compiler version 5.8
--> bcc582.zip
install Borland at c:\Borland\BCC58

create directory: c:\git_repo\
goto: c:\git_repo\
run CMD
c:\git_repo\git clone https://github.com/yudhi-irawan/001-Harbour-MiniGUI-openConnection-TMySQLServer.git
c:\git_repo\cd 001-Harbour-MiniGUI-openConnection-TMySQLServer
dir

run vscode or your favourit editor
code .
open new terminal
compile.bat
run demo.exe


other sample at: 
c:\MiniGUI\SAMPLES\BASIC\MYSQL\

other reference: 
c:\MiniGUI\SAMPLES\BASIC\ADORDD_3\
c:\MiniGUI\SAMPLES\Advanced\MiniSql\

</pre>


<br><br>
 
 
 Thanks you. 

 👋 👀 🌱 💞️ 📫 


<img src="assets/img/Screenshot-001.png" alt="" />