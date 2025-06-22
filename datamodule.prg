*--------------------------------------------------------------*
function openConnection()                         
*--------------------------------------------------------------*
cHostName:= "localhost"
cUser:= "root"
cPassWord:= "1234"
cDataBase:= "mcg_db"

oServer := TMySQLServer():New(cHostName, cUser, cPassWord )
oServer:SelectDB( cDatabase )
Return oServer


//TMySQLServer()
//https://jcsn.wordpress.com/harbour-minigui/coding-minigui/mysql-koneksi/


/*
cConnectionString := ;
   "Driver={MySQL ODBC 3.51 Driver};" + ; // Corresponde exatamente ao driver ODBC que foi instalado
   "Server=localhost;" + ;                // endereço do servidor, IP ou nome
   "Port=3306;" + ;                       // 3306 é a default. Só precisa indicar aqui se for diferente
   "Database=test;" + ;                   // nome do banco de dados. precisa ter sido previamente criado no servidor
   "User ID=root;" + ;                    // nome de usuário cadastrado no servidor MySQL
   "Password=suasenha;" + ;               // senha do usuário
   "Collation=latin1;" + ;                // Só pra garantir, compatível com PTISO
   "Option=131072;" + ;                   // Esta apenas segui o barco. Tem a ver com configurações extras
   "dsn=;"                                // Só se usar dsn criada no Windows vai isto com o nome, e pode substituir todo resto

nConnection := RDDINFO( RDDI_CONNECT, { "ODBC", cConnectionString } )
*/


/*
http://www.pctoledo.com.br/forum/viewtopic.php?f=43&t=15019
nConnection := RDDINFO( RDDI_CONNECT, { "ODBC", "Server=localhost;Driver={MySQL ODBC 3.51 Driver};dsn=;User=root;pwd=suasenha;database=test;" } )




*/

/*
   LOCAL cConStr := ;
      "DBQ=" + GetStartupFolder() + "\bd1.mdb;" + ;
      "Driver={Microsoft Access Driver (*.mdb)}"

   LOCAL dsFunctions := TODBC():New( cConStr )
*/

/*
oConexion = todbc():new('DBQ=bd1.mdb;Driver={Microsoft Access Driver (*.mdb)}')
*/	

/*
nConnection := RDDINFO( RDDI_CONNECT, { "ODBC", "Server=localhost;Driver={MySQL ODBC 3.51 Driver};dsn=;User=root;database=test;" } )
*/


/*
function openConnection()
*return todbc():new('DRIVER=Firebird/InterBase(r) driver;UID=SYSDBA;PWD=masterkey;DBNAME=EMPLOYEE.FDB;')
*return todbc():new('DRIVER=Firebird/InterBase(r) driver;UID=SYSDBA;PWD=masterkey;DBNAME=HRISNEW.ORA;')
return todbc():new('DRIVER=Firebird/InterBase(r) driver;UID=SYSDBA;PWD=masterkey;DBNAME='+pubDBNAME+';')
***return todbc():new('DRIVER=Firebird/InterBase(r) driver;UID=SYSDBA;PWD=masterkey;DBNAME=MACAN:\hris\HRIS.FDB;')
*/

/*
DRIVER=Firebird/InterBase(r) driver;UID=SYSDBA;PWD=masterkey;
DBNAME=MyServer:C:\database\myData.fdb;
*/

