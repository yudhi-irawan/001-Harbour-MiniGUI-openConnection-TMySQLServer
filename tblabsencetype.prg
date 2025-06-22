*-- File name : tblabsencetype.prg
*-- Created Project by : yudhi irawan
*-- Contact Social Media :
*-- Description Project :
*--
*-- Last Edited : 2025-06-22
*--				  2020-11-15



*----------------------------------------------------
*-- Copyright 2018 https://telegram.me/yudhi_irawan
*-- PHP & MiniGUI - Generator ver. 1.34v
*-- ~minigui
*-- MySQL
*-----------------------------------------------------

#include "hmg.ch"
*------------------------------------------------------*
Function tblabsencetype()
*------------------------------------------------------*
	Private cAddEditDelete
	Private one_afieldnames:={;
		'id';
		,'AbsenceTypeCode';
		,'Description';
		,'Description2';
		,'Remark';
		,'Point';
		,'PaidSalary';
		,'PaidLeave';
		,'PaidMeal';
		,'PaidTransport';
		,'EntryTimeInYN';
		,'EntryTimeOutYN';
	}
	
	Private one_alabelwidths:={;
		150;
		,150;
		,150;
		,150;
		,150;
		,150;
		,150;
		,150;
		,150;
		,150;
		,150;
		,150;
	}
	
	Private one_atextboxtooltips:={;
		'';
		,'FORMAT: XXXX';
		,'';
		,'';
		,'';
		,'';
		,'';
		,'';
		,'';
		,'';
		,'';
		,'';
	}
	
	Private oConnection:=openConnection()


	DEFINE WINDOW frm_one AT 0 , 0 WIDTH 800 HEIGHT 650 MODAL NOSIZE NOSYSMENU;
		on init ( adjust(), FormShow() );
		on release ( oConnection:Destroy() );
		font 'ms sans serif' size 10
	
		ON KEY ESCAPE ACTION {|| ThisWindow.Release() }
		
		DEFINE TOOLBAR ToolBar1 BUTTONSIZE 60,40 IMAGESIZE 32,32 FLAT BORDER
	
			BUTTON btnFirst ;
				CAPTION "Fi&rst" ;
				PICTURE "pictFirst" ;
				ACTION one_btnFirstClick()
	
			BUTTON btnPrev ;
				CAPTION "Pre&v" ;
				PICTURE "pictPrev" ;
				ACTION one_btnPrevClick()
	
			BUTTON btnNext ;
				CAPTION "Nex&t" ;
				PICTURE "pictNext" ;
				ACTION one_btnNextClick()
	
			BUTTON btnLast ;
				CAPTION "&Last" ;
				PICTURE "pictLast" ;
				ACTION one_btnLastClick() SEPARATOR
	
			BUTTON btnAdd ;
				CAPTION "&Add" ;
				PICTURE "pictAdd" ;
				ACTION one_btnAddClick()
	
			BUTTON btnEdit ;
				CAPTION "&Edit" ;
				PICTURE "pictEdit" ;
				ACTION one_btnEditClick()
	
			BUTTON btnDelete ;
				CAPTION "&Delete" ;
				PICTURE "pictDelete" ;
				ACTION one_btnDeleteClick()
	
			BUTTON btnOk ;
				CAPTION "&Ok" ;
				PICTURE "pictOk" ;
				ACTION one_btnOkClick()
	
			BUTTON btnCancel ;
				CAPTION "&Cancel" ;
				PICTURE "pictCancel" ;
				ACTION one_btnCancelClick()
	
			BUTTON btnPrint ;
				CAPTION "&Print" ;
				PICTURE "pictPrint" ;
				ACTION one_btnPrintClick()
	
			BUTTON btnExit ;
				CAPTION "E&xit" ;
				PICTURE "pictExit" ;
				ACTION one_btnExitClick()
	
		END TOOLBAR
	
		DEFINE WINDOW frmChild_one AT 80 , 20 WIDTH 740 HEIGHT 300 VIRTUAL WIDTH 1000 VIRTUAL HEIGHT 1000 TITLE "" ICON NIL PANEL CURSOR NIL ON INIT Nil ON RELEASE Nil ON INTERACTIVECLOSE Nil ON MOUSECLICK Nil ON MOUSEDRAG Nil ON MOUSEMOVE Nil ON SIZE Nil ON MAXIMIZE Nil ON MINIMIZE Nil ON PAINT Nil BACKCOLOR Nil NOTIFYICON NIL NOTIFYTOOLTIP NIL ON NOTIFYCLICK Nil ON GOTFOCUS Nil ON LOSTFOCUS Nil ON SCROLLUP Nil ON SCROLLDOWN Nil ON SCROLLLEFT Nil ON SCROLLRIGHT Nil ON HSCROLLBOX Nil ON VSCROLLBOX Nil
			one_display_label()
			one_display_textbox(1)
		END WINDOW
	
		DEFINE GRID one_GridData
			row 400
			col 20
			width 500
			height 220
			headers one_GridData_headers()
			widths one_GridData_widths()
			justify one_GridData_justify()
			columncontrols	one_GridData_columncontrols()
			MULTISELECT .T.
			CHECKBOXES .F.
			on dblclick one_GridData_on_dblclick()
			on change one_GridData_on_change()
		END GRID
	
		@ 570, 700 LABEL LabelStatusAddEditDelete VALUE ' STATUS ' CENTERALIGN VCENTERALIGN BORDER BACKCOLOR YELLOW WIDTH 60
	
	END WINDOW
	CENTER WINDOW frm_one
	ACTIVATE WINDOW frm_one

RETURN Nil
*

*
*toolbar data from here!------------------------------------------------------
static function one_btnFirstClick()
	frm_one.one_GridData.Value := 1
return nil

static function one_btnPrevClick()
	local nRow := frm_one.one_GridData.Value
	if len(nRow)=0
	else
		frm_one.one_GridData.value := iif(nRow[1] > 1, nRow[1]-1, 1)
	endif
return nil

static function one_btnNextClick()
	local nRow := frm_one.one_GridData.Value
	local nItemCount := frm_one.one_GridData.ItemCount
	if len(nRow)=0
	else
		frm_one.one_GridData.Value := iif(nRow[1] < nItemCount, nRow[1]+1, nItemCount)
	endif
return nil

static function one_btnLastClick()
	local nRow := frm_one.one_GridData.ItemCount
	frm_one.one_GridData.Value := nRow
return nil

static function one_btnAddClick()
	cAddEditDelete:='A'
	one_ButtonControl(.F.,.F.,.F.,.F.,.F.,.F.,.F.,.T.,.T.,.F.,.F.)
	//label form
	SetProperty( 'frm_one', 'LabelStatusAddEditDelete', 'Value', 'Add')
	_Add()
return nil

static function one_btnEditClick()
	cAddEditDelete:='E'
	one_ButtonControl(.F.,.F.,.F.,.F.,.F.,.F.,.F.,.T.,.T.,.F.,.F.)
	//label form
	SetProperty( 'frm_one', 'LabelStatusAddEditDelete', 'Value', 'Edit')
	_Edit()
return nil

static function one_btnDeleteClick()
	cAddEditDelete:='D'
	one_ButtonControl(.F.,.F.,.F.,.F.,.F.,.F.,.F.,.T.,.T.,.F.,.F.)
	//label form
	SetProperty( 'frm_one', 'LabelStatusAddEditDelete', 'Value', 'Delete')
	_Delete()
return nil

static function one_btnOkClick()
	SetProperty( 'frm_one', 'LabelStatusAddEditDelete', 'Value', 'STATUS')
	_Ok()
return nil

static function one_btnCancelClick()
	one_ButtonControl(.T.,.T.,.T.,.T.,.T.,.T.,.T.,.F.,.F.,.T.,.T.)
	SetProperty( 'frm_one', 'LabelStatusAddEditDelete', 'Value', 'STATUS')
	_Cancel()
	cAddEditDelete:='X'
return nil

static function one_btnPrintClick()
return nil

static function one_btnExitClick()
	_HMG_DialogCancelled := .T.
	ThisWindow.Release
return nil

*toolbar data to here!------------------------------------------------------



*grid data from here!------------------------------------------------------
static function one_GridData_headers()
return {;
	'Id';
	,'AbsenceType Code';
	,'Description';
	,'Short Desc';
	,'Remark';
	,'Point';
	,'Paid Salary(%)';
	,'Paid Leave(%)';
	,'Paid Meal(%)';
	,'Paid Transport(%)';
	,'Entry Time-IN';
	,'Entry Time-Out';
}

static function one_GridData_widths()
return {;
	0;
	,100;
	,100;
	,100;
	,100;
	,100;
	,100;
	,100;
	,100;
	,100;
	,100;
	,100;
}

static function one_GridData_justify()
return {;
	BROWSE_JTFY_RIGHT;
	,BROWSE_JTFY_LEFT;
	,BROWSE_JTFY_LEFT;
	,BROWSE_JTFY_LEFT;
	,BROWSE_JTFY_LEFT;
	,BROWSE_JTFY_RIGHT;
	,BROWSE_JTFY_RIGHT;
	,BROWSE_JTFY_RIGHT;
	,BROWSE_JTFY_RIGHT;
	,BROWSE_JTFY_RIGHT;
	,BROWSE_JTFY_LEFT;
	,BROWSE_JTFY_LEFT;
}

static function one_GridData_columncontrols()
return {;
	{"TEXTBOX","NUMERIC"};
	,{"TEXTBOX","CHARACTER"};
	,{"TEXTBOX","CHARACTER"};
	,{"TEXTBOX","CHARACTER"};
	,{"TEXTBOX","CHARACTER"};
	,{"TEXTBOX","NUMERIC"};
	,{"TEXTBOX","NUMERIC"};
	,{"TEXTBOX","NUMERIC"};
	,{"TEXTBOX","NUMERIC"};
	,{"TEXTBOX","NUMERIC"};
	,{"COMBOBOX",{"-","Y","N"}};
	,{"COMBOBOX",{"-","Y","N"}};
}

static function one_GridData_on_dblclick()
return nil

static function one_GridData_on_change()
	one_display_textbox(2)
	one_DisableMaskEdit()
return nil
*grid data to here!------------------------------------------------------

*checkbox from here!-----------------------------------------------------

*checkbox to here!-----------------------------------------------------


*label/textbox data from here!------------------------------------------------------

static function one_display_label()
	local aLabel, nRow := 10
	aLabel:=one_GridData_headers()
	
	@ nRow+0,50	LABEL lblid VALUE aLabel[1] VCENTERALIGN BORDER BACKCOLOR YELLOW WIDTH one_alabelwidths[1]
	@ nRow+0,50	LABEL lblAbsenceTypeCode VALUE aLabel[2] VCENTERALIGN BORDER BACKCOLOR YELLOW WIDTH one_alabelwidths[2]
	@ nRow+25,50	LABEL lblDescription VALUE aLabel[3] VCENTERALIGN BORDER BACKCOLOR YELLOW WIDTH one_alabelwidths[3]
	@ nRow+50,50	LABEL lblDescription2 VALUE aLabel[4] VCENTERALIGN BORDER BACKCOLOR YELLOW WIDTH one_alabelwidths[4]
	@ nRow+75,50	LABEL lblRemark VALUE aLabel[5] VCENTERALIGN BORDER BACKCOLOR YELLOW WIDTH one_alabelwidths[5]
	@ nRow+100,50	LABEL lblPoint VALUE aLabel[6] VCENTERALIGN BORDER BACKCOLOR YELLOW WIDTH one_alabelwidths[6]
	@ nRow+125,50	LABEL lblPaidSalary VALUE aLabel[7] VCENTERALIGN BORDER BACKCOLOR YELLOW WIDTH one_alabelwidths[7]
	@ nRow+150,50	LABEL lblPaidLeave VALUE aLabel[8] VCENTERALIGN BORDER BACKCOLOR YELLOW WIDTH one_alabelwidths[8]
	@ nRow+175,50	LABEL lblPaidMeal VALUE aLabel[9] VCENTERALIGN BORDER BACKCOLOR YELLOW WIDTH one_alabelwidths[9]
	@ nRow+200,50	LABEL lblPaidTransport VALUE aLabel[10] VCENTERALIGN BORDER BACKCOLOR YELLOW WIDTH one_alabelwidths[10]
	@ nRow+225,50	LABEL lblEntryTimeInYN VALUE aLabel[11] VCENTERALIGN BORDER BACKCOLOR YELLOW WIDTH one_alabelwidths[11]
	@ nRow+250,50	LABEL lblEntryTimeOutYN VALUE aLabel[12] VCENTERALIGN BORDER BACKCOLOR YELLOW WIDTH one_alabelwidths[12]
return nil





static function one_display_label_HAPUSAJA()
	local aLabel, nCnt, cLblNames, nRow := 10
	aLabel:=one_GridData_headers()
	
	//
	FOR nCnt := 1 TO Len( aLabel )
		cLblNames := 'Label_' + hb_ntos(nCnt)
		@ nRow, 50 LABEL &cLblNames VALUE aLabel[nCnt] VCENTERALIGN BORDER BACKCOLOR YELLOW WIDTH one_alabelwidths[nCnt]
		nRow += 25
	NEXT
	//

return nil

static function one_display_textbox(nI)
	local nX, nRow := 10, nCol
	local aPosition, aDataCell, xDataCell, cToolTipGrid:=''
	
	if nI=1
		@ nRow+0, 225 GETBOX meid Value 0 Width 100 Picture '99999'
		@ nRow+0, 225 GETBOX meAbsenceTypeCode Value '' Width 100 Picture '@K! XXXX'
		@ nRow+25, 225 GETBOX meDescription Value '' Width 300 Picture '@K! XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
		@ nRow+50, 225 GETBOX meDescription2 Value '' Width 270 Picture '@K! XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
		@ nRow+75, 225 GETBOX meRemark Value '' Width 190 Picture '@K! XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
		@ nRow+100, 225 GETBOX mePoint Value 0 Width 50 Picture '@K! 99'
		@ nRow+125, 225 GETBOX mePaidSalary Value 0 Width 50 Picture '@K! 999'
		@ nRow+150, 225 GETBOX mePaidLeave Value 0 Width 50 Picture '@K! 999'
		@ nRow+175, 225 GETBOX mePaidMeal Value 0 Width 50 Picture '@K! 999'
		@ nRow+200, 225 GETBOX mePaidTransport Value 0 Width 50 Picture '@K! 999'
		@ nRow+225, 225 COMBOBOX meEntryTimeInYN WIDTH 125 ITEMS {'-','Y','N'} VALUE 1 DISPLAYEDIT
		@ nRow+250, 225 COMBOBOX meEntryTimeOutYN WIDTH 125 ITEMS {'-','Y','N'} VALUE 1 DISPLAYEDIT
	
	else  //----------------------------------------------------------> if nI=1 
	
		cToolTipGrid:=''
		aPosition:=frm_one.one_GridData.value
		if len(aPosition)=0
		else
			aDataCell:=frm_one.one_GridData.Item (aPosition[1])
	
			xDataCell:=aDataCell[1]
			//TEXTBOX-NUMERIC
			SetProperty( 'frmChild_one', 'meid', 'Value', xDataCell)      //-->ChildForm
			SetProperty( 'frmChild_one', 'meid', 'Tooltip', hb_ntos(xDataCell))      //-->ChildForm
			cToolTipGrid+=hb_ntos(xDataCell)+ ' ' //+CRLF+CRLF
	
			xDataCell:=aDataCell[2]
			//TEXTBOX-CHARACTER
			SetProperty( 'frmChild_one', 'meAbsenceTypeCode', 'Value', xDataCell)      //-->ChildForm
			SetProperty( 'frmChild_one', 'meAbsenceTypeCode', 'Tooltip', xDataCell)      //-->ChildForm
			cToolTipGrid+=xDataCell+ ' ' //+CRLF+CRLF
	
			xDataCell:=aDataCell[3]
			//TEXTBOX-CHARACTER
			SetProperty( 'frmChild_one', 'meDescription', 'Value', xDataCell)      //-->ChildForm
			SetProperty( 'frmChild_one', 'meDescription', 'Tooltip', xDataCell)      //-->ChildForm
			cToolTipGrid+=xDataCell+ ' ' //+CRLF+CRLF
	
			xDataCell:=aDataCell[4]
			//TEXTBOX-CHARACTER
			SetProperty( 'frmChild_one', 'meDescription2', 'Value', xDataCell)      //-->ChildForm
			SetProperty( 'frmChild_one', 'meDescription2', 'Tooltip', xDataCell)      //-->ChildForm
			cToolTipGrid+=xDataCell+ ' ' //+CRLF+CRLF
	
			xDataCell:=aDataCell[5]
			//TEXTBOX-CHARACTER
			SetProperty( 'frmChild_one', 'meRemark', 'Value', xDataCell)      //-->ChildForm
			SetProperty( 'frmChild_one', 'meRemark', 'Tooltip', xDataCell)      //-->ChildForm
			cToolTipGrid+=xDataCell+ ' ' //+CRLF+CRLF
	
			xDataCell:=aDataCell[6]
			//TEXTBOX-NUMERIC
			SetProperty( 'frmChild_one', 'mePoint', 'Value', xDataCell)      //-->ChildForm
			SetProperty( 'frmChild_one', 'mePoint', 'Tooltip', hb_ntos(xDataCell))      //-->ChildForm
			cToolTipGrid+=hb_ntos(xDataCell)+ ' ' //+CRLF+CRLF
	
			xDataCell:=aDataCell[7]
			//TEXTBOX-NUMERIC
			SetProperty( 'frmChild_one', 'mePaidSalary', 'Value', xDataCell)      //-->ChildForm
			SetProperty( 'frmChild_one', 'mePaidSalary', 'Tooltip', hb_ntos(xDataCell))      //-->ChildForm
			cToolTipGrid+=hb_ntos(xDataCell)+ ' ' //+CRLF+CRLF
	
			xDataCell:=aDataCell[8]
			//TEXTBOX-NUMERIC
			SetProperty( 'frmChild_one', 'mePaidLeave', 'Value', xDataCell)      //-->ChildForm
			SetProperty( 'frmChild_one', 'mePaidLeave', 'Tooltip', hb_ntos(xDataCell))      //-->ChildForm
			cToolTipGrid+=hb_ntos(xDataCell)+ ' ' //+CRLF+CRLF
	
			xDataCell:=aDataCell[9]
			//TEXTBOX-NUMERIC
			SetProperty( 'frmChild_one', 'mePaidMeal', 'Value', xDataCell)      //-->ChildForm
			SetProperty( 'frmChild_one', 'mePaidMeal', 'Tooltip', hb_ntos(xDataCell))      //-->ChildForm
			cToolTipGrid+=hb_ntos(xDataCell)+ ' ' //+CRLF+CRLF
	
			xDataCell:=aDataCell[10]
			//TEXTBOX-NUMERIC
			SetProperty( 'frmChild_one', 'mePaidTransport', 'Value', xDataCell)      //-->ChildForm
			SetProperty( 'frmChild_one', 'mePaidTransport', 'Tooltip', hb_ntos(xDataCell))      //-->ChildForm
			cToolTipGrid+=hb_ntos(xDataCell)+ ' ' //+CRLF+CRLF
	
			xDataCell:=aDataCell[11]
			//COMBOBOX
			SetProperty( 'frmChild_one', 'meEntryTimeInYN', 'Value', xDataCell)      //-->ChildForm
			SetProperty( 'frmChild_one', 'meEntryTimeInYN', 'Tooltip', hb_ntos(xDataCell))      //-->ChildForm
			cToolTipGrid+=hb_ntos(xDataCell)+ ' ' //+CRLF+CRLF
	
			xDataCell:=aDataCell[12]
			//COMBOBOX
			SetProperty( 'frmChild_one', 'meEntryTimeOutYN', 'Value', xDataCell)      //-->ChildForm
			SetProperty( 'frmChild_one', 'meEntryTimeOutYN', 'Tooltip', hb_ntos(xDataCell))      //-->ChildForm
			cToolTipGrid+=hb_ntos(xDataCell)+ ' ' //+CRLF+CRLF
	
			SetProperty( 'frm_one', 'one_GridData', 'Tooltip', cToolTipGrid)
		endif
	endif
return nil

*label/textbox data to here!------------------------------------------------------


static procedure adjust()
	frm_one.one_GridData.width := frm_one.width - 60
	frm_one.one_GridData.height:= ( frm_one.height- frm_one.one_GridData.row ) - 80 //60
	frm_one.LabelStatusAddEditDelete.row:= frm_one.one_GridData.row + frm_one.one_GridData.height + 10
return

static procedure FormShow(cKey)
	cAddEditDelete:='X'
	one_ButtonControl(.T.,.T.,.T.,.T.,.T.,.T.,.T.,.F.,.F.,.T.,.T.)
	Show1st(cKey)
return

static procedure Show1st(cKey)
	local nI, nPos:=1, Str
	local oQuery
	
	frm_one.one_GridData.Deleteallitems
	
	Str:='SELECT id,AbsenceTypeCode,Description,Description2,Remark,Point,PaidSalary,PaidLeave,PaidMeal,PaidTransport,EntryTimeInYN,EntryTimeOutYN FROM tblAbsenceType ORDER BY AbsenceTypeCode'
	
	oQuery := oConnection:Query(Str)
	If oQuery:NetErr()
		MsgInfo("SQL SELECT error: " + oQuery:Error())
		RELEASE WINDOW ALL
		Quit
	Endif
	
	For i := 1 To oQuery:LastRec()
		oRow := oQuery:GetRow(i)
		frm_one.one_GridData.AddItem (oQuery:aRow)
		oQuery:Skip(1)
	Next
	oQuery:Destroy()
	frm_one.one_GridData.setfocus
	
	one_display_textbox(2)
	one_DisableMaskEdit()
	
	frmChild_one.meid.hide
	frmChild_one.lblid.hide
return

static procedure one_ButtonControl(lFirst,lPrev,lNext,lLast,lAdd,lEdit,lDelete,lSave,lCancel,lPrint,lExit)
	frm_one.ToolBar1.btnFirst.Enabled:=lFirst
	frm_one.ToolBar1.btnPrev.Enabled:=lPrev
	frm_one.ToolBar1.btnNext.Enabled:=lNext
	frm_one.ToolBar1.btnLast.Enabled:=lLast
	frm_one.ToolBar1.btnAdd.Enabled:=lAdd
	frm_one.ToolBar1.btnEdit.Enabled:=lEdit
	frm_one.ToolBar1.btnDelete.Enabled:=lDelete
	frm_one.ToolBar1.btnOk.Enabled:=lSave
	frm_one.ToolBar1.btnCancel.Enabled:=lCancel
	frm_one.ToolBar1.btnPrint.Enabled:=lPrint
	frm_one.ToolBar1.btnExit.Enabled:=lExit
return


static procedure one_EnableMaskEdit
	local nX
	for nX=1 to len(one_afieldnames)
		SetProperty( 'frmChild_one', 'me'+alltrim(one_afieldnames[nX]), 'Enabled', .T.)                  //-->ChildForm
		SetProperty( 'frmChild_one', 'me'+alltrim(one_afieldnames[nX]), 'Tooltip', one_atextboxtooltips[nX])  //-->ChildForm
	next
return

static procedure one_DisableMaskEdit
	local nX
	for nX=1 to len(one_afieldnames)
		SetProperty( 'frmChild_one', 'me'+alltrim(one_afieldnames[nX]), 'Enabled', .F.)
	next
return

static procedure _Add
	empty_textbox()
	one_EnableMaskEdit()
	SetProperty( 'frm_one', 'one_GridData', 'Enabled', .F.)
	frmChild_one.meAbsenceTypeCode.Setfocus()		//-->ChildForm
return

static procedure _Edit
	one_EnableMaskEdit()
	SetProperty( 'frm_one', 'one_GridData', 'Enabled', .F.)
	SetProperty( 'frmChild_one', 'meAbsenceTypeCode', 	'Enabled', .F.)	//-->ChildForm
	frmChild_one.meDescription.Setfocus()		//-->ChildForm
return

static procedure _Delete
	//empty!
return

static procedure _Cancel
	cAddEditDelete:='X'
	one_DisableMaskEdit()
	one_display_textbox(2)
	SetProperty( 'frm_one', 'one_GridData', 'Enabled', .T.)
	frm_one.one_GridData.Setfocus()
return

static procedure empty_textbox
return

static Procedure _Ok
	local Str, n, cResult
	local aPosition
	local aDataCell, xData
	
	Private meid;
		,meAbsenceTypeCode;
		,meDescription;
		,meDescription2;
		,meRemark;
		,mePoint;
		,mePaidSalary;
		,mePaidLeave;
		,mePaidMeal;
		,mePaidTransport;
		,meEntryTimeInYN;
		,meEntryTimeOutYN;
	
	//-->ChildForm
	meid:=frmChild_one.meid.value
	meAbsenceTypeCode:=frmChild_one.meAbsenceTypeCode.value
	meDescription:=frmChild_one.meDescription.value
	meDescription2:=frmChild_one.meDescription2.value
	meRemark:=frmChild_one.meRemark.value
	mePoint:=frmChild_one.mePoint.value
	mePaidSalary:=frmChild_one.mePaidSalary.value
	mePaidLeave:=frmChild_one.mePaidLeave.value
	mePaidMeal:=frmChild_one.mePaidMeal.value
	mePaidTransport:=frmChild_one.mePaidTransport.value
	meEntryTimeInYN:=frmChild_one.meEntryTimeInYN.value
	meEntryTimeOutYN:=frmChild_one.meEntryTimeOutYN.value
	
	if cAddEditDelete='A'
	
		Str := "INSERT INTO tblAbsenceType("+;
			"id"+;
			",AbsenceTypeCode"+;
			",Description"+;
			",Description2"+;
			",Remark"+;
			",Point"+;
			",PaidSalary"+;
			",PaidLeave"+;
			",PaidMeal"+;
			",PaidTransport"+;
			",EntryTimeInYN"+;
			",EntryTimeOutYN"+;
		")"+;
		" VALUES ("+;
			''+QuotedStr(str(meid))+;
			','+QuotedStr(meAbsenceTypeCode)+;
			','+QuotedStr(meDescription)+;
			','+QuotedStr(meDescription2)+;
			','+QuotedStr(meRemark)+;
			','+QuotedStr(str(mePoint))+;
			','+QuotedStr(str(mePaidSalary))+;
			','+QuotedStr(str(mePaidLeave))+;
			','+QuotedStr(str(mePaidMeal))+;
			','+QuotedStr(str(mePaidTransport))+;
			','+QuotedStr(str(meEntryTimeInYN))+;
			','+QuotedStr(str(meEntryTimeOutYN))+;
		')'
	
		//StrToFile('tblabsencetype.zzz',Str)
	
		oQuery := oConnection:Query(Str)
		If oQuery:NetErr()
			MsgInfo("SQL SELECT error: " + oQuery:Error())
			//RELEASE WINDOW ALL
			//Quit
		Endif
	
		//!!!FormShow(meAbsenceTypeCode) //setelah add ----------> harusnya cursor ke data tsb!!!!!!!!!!!!!!!!!
	
	elseif cAddEditDelete='E'
	
		Str := "UPDATE tblAbsenceType SET "+;
					"id = "+QuotedStr(str(meid)) +' '+;
					",AbsenceTypeCode = "+QuotedStr(meAbsenceTypeCode) +' '+;
					",Description = "+QuotedStr(meDescription) +' '+;
					",Description2 = "+QuotedStr(meDescription2) +' '+;
					",Remark = "+QuotedStr(meRemark) +' '+;
					",Point = "+QuotedStr(str(mePoint)) +' '+;
					",PaidSalary = "+QuotedStr(str(mePaidSalary)) +' '+;
					",PaidLeave = "+QuotedStr(str(mePaidLeave)) +' '+;
					",PaidMeal = "+QuotedStr(str(mePaidMeal)) +' '+;
					",PaidTransport = "+QuotedStr(str(mePaidTransport)) +' '+;
					",EntryTimeInYN = "+QuotedStr(str(meEntryTimeInYN)) +' '+;
					",EntryTimeOutYN = "+QuotedStr(str(meEntryTimeOutYN)) +' '+;
				"WHERE "+;
					"AbsenceTypeCode = "+QuotedStr(AbsenceTypeCode)
	
	
		StrToFile('tblabsencetype.zzz',Str)
	
		oQuery := oConnection:Query(Str)
		If oQuery:NetErr()
			MsgInfo("SQL SELECT error: " + oQuery:Error())
			//RELEASE WINDOW ALL
			//Quit
		Endif
	
	elseif cAddEditDelete='D'
		//not yet
	endif
	
	one_ButtonControl(.T.,.T.,.T.,.T.,.T.,.T.,.T.,.F.,.F.,.T.,.T.)
	one_DisableMaskEdit()
	SetProperty( 'frm_one', 'one_GridData', 'Enabled', .T.)
	frm_one.one_GridData.Setfocus()
return
