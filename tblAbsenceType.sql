-- Database: test

-- NUMERIC(2,0) = DECIMAL(2,0)
-- NUMERIC(6,2) = DECIMAL(6,0)
CREATE TABLE tblAbsenceType
(
	ID				Integer				NOT NULL		 AUTO_INCREMENT	,
	AbsenceTypeCode	VARCHAR(4) DEFAULT '0000' NOT NULL,
	Description		VARCHAR(60) DEFAULT '', 
	Description2	VARCHAR(30) DEFAULT '', 
	Remark			VARCHAR(30) DEFAULT '',
	
	Point			NUMERIC(2,0) DEFAULT 0 NOT NULL,
	PaidSalary		NUMERIC(6,2) DEFAULT 0.00,
	PaidLeave		NUMERIC(6,2) DEFAULT 0.00,
	PaidMeal		NUMERIC(6,2) DEFAULT 0.00,
	PaidTransport	NUMERIC(6,2) DEFAULT 0.00,
	PaidIncentive	NUMERIC(6,2) DEFAULT 0.00,

	/*
	alter table tblAbsenceType
	add PaidIncentive	 NUMERIC(6,2) DEFAULT 0.00,
	*/
	
	EntryTimeInYN	SmallInt DEFAULT 1 NOT NULL, 
	/* {'-','Y','N'} */
	EntryTimeOutYN	SmallInt DEFAULT 1 NOT NULL,
	
	UserEdit		VARCHAR(10) DEFAULT '',


	DateTimeEdit	DATETIME					DEFAULT 	now()	,

    
	PRIMARY KEY (ID)
	
);

INSERT INTO tblAbsenceType (AbsenceTypeCode,Description,           Description2,Remark,Point,PaidSalary,PaidLeave,PaidMeal,PaidTransport,EntryTimeInYN,EntryTimeOutYN,UserEdit) VALUES
('A',            'ALPA',                '',	 	    '',    5,    0,         0,        0,       0,            3,          3,           'SAMPLE'),
('CH',           'CUTI HAID',           '',		    '',    0,    100,       0,        0,       0,            3,          3,           'SAMPLE'),
('CM',           'CUTI MELAHIRKAN',     '',		    '',    0,    100,       0,        0,       0,            3,          3,           'SAMPLE'),
('CN',           'CUTI NIKAH',          '',		    '',    0,    100,       0,        0,       0,            3,          3,           'SAMPLE'),
('CT',           'CUTI TAHUNAN',        '',		    '',    0,    100,       0,        0,       0,            3,          3,           'SAMPLE'),
('DL',           'DINAS LUAR',          '',		    '',    0,    100,       0,        100,     100,          3,          3,           'SAMPLE'),
('I',            'IJIN/SAKIT',          '',		    '',    1,    0,         0,        0,       0,            3,          3,           'SAMPLE'),
('IB',           'IJIN/SAKIT (DIBAYAR)','',		    '',    0,    100,       0,        0,       0,            3,          3,           'SAMPLE'),
('N',            'NORMAL',              '',		    '',    0,    100,       0,        100,     100,          3,          3,           'SAMPLE'),
('SC',           'SCORSING',            '',	 	    '',    2,    0,         0,        0,       0,            3,          3,           'SAMPLE'),
('P',            'PULANG',              '',	 	    '',    2,    11,        0,        11,      100,          3,          2,           'SAMPLE'),
('PI',           'PULANG AWAL/I',       '',	 	    '',    1,    11,        0,        11,      100,          3,          2,           'SAMPLE'),
('PB',           'PULANG DIBAYAR',      '',	 	    '',    0,    100,       0,        11,      100,          3,          2,           'SAMPLE'),
('T',            'TERLAMBAT',           '',	 	    '',    2,    11,        0,        11,      100,          2,          3,           'SAMPLE'),
('TB',           'TERLAMBAT (DIBAYAR)', '',	 	    '',    0,    100,       0,        100,     100,          2,          3,           'SAMPLE');


