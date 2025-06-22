#include "minigui.ch"
#include "miniprint.ch"

function main()
		
   SET CENTURY ON
   SET DATE GERMAN

   DEFINE WINDOW winMain ;
      AT 0, 0 WIDTH 640 HEIGHT 460 ;
      TITLE "001-Harbour-MiniGUI-openConnection-TMySQLServer" ;
      MAIN ;
      ON INIT CreateData()
	  
	  ON KEY ESCAPE ACTION {|| ThisWindow.Release() }
      
      DEFINE MAIN MENU
         POPUP "&File"
			Item '1. Absence Type'  ACTION tblAbsenceType()			
			Item "E&xit" action thiswindow.release()
         END POPUP
      END MENU   
      
   END WINDOW

   winMain.center
   winMain.activate

return nil
*
*
*
function CreateData()
return nil
*
*
*
function DoubleQuotedStr(cParam)
return '"'+alltrim(cParam)+'"'
*
*
*
function QuotedStr(cParam)
return "'"+alltrim(cParam)+"'"
*
*
*
function QuotedStrPercent(cParam)
return "'%"+alltrim(cParam)+"%'"
*
*
*
Function StrToFile(cFile,cStr)
Local OutHandle
OutHandle=FCREATE(cFile) ; FWRITE(OutHandle, cStr+CHR(13)+CHR(10)) ; fclose(OutHandle)
return nil
*
*
*
#include "datamodule.prg"
#include "tblAbsenceType.prg"
