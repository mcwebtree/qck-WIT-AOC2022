Class MC2022AOC.Day3 [ Abstract ]
{

/// 
/// Lowercase item types a through z have priorities 1 through 26.
/// Uppercase item types A through Z have priorities 27 through 52.
/// 
ClassMethod getCodePriority(strLetter As %String) As %Integer
{
	S intAscii=$A(strLetter)
	/// A=64 Z=90  a=97  z=122
	I (intAscii<95) {
		s intVal=intAscii-38      //-63+26	
	} else {
		s intVal=intAscii-96      //-96	
	}
	q intVal
}

ClassMethod runGame2(intLive As %Integer = 1, intVerb As %Integer = 0) As %Integer
{
	I intLive=1
	{ d ..initLive() }
	ELSE 
	{ d ..initTest() }
	
	S intSum=0
	S strObj=""
	
	for intRow=1:3:^AOCD3 {
		s strRow1=^AOCD3(intRow)
		s strRow2=^AOCD3(intRow+1)
		s strRow3=^AOCD3(intRow+2)
		s intLen=$L(strRow1)
		
		for intLet=1:1:intLen
		{
			s strLet=$E(strRow1,intLet,intLet)
			I (strRow2[strLet)&&(strRow3[strLet)
			{					
				S intVal=..getCodePriority(strLet)
				S intSum=intSum+intVal
				S ^AOCD3(intRow)=$LB(strRow1,strLet,intVal)
				Q 
			}
		}
	}
	w "Total priority sum: "_intSum,!	
	Q intSum
}

ClassMethod runGame(intLive As %Integer = 1, intVerb As %Integer = 0) As %Integer
{
	I intLive=1
	{ d ..initLive() }
	ELSE 
	{ d ..initTest() }
	
	S intSum=0
	S strObj=""
	
	for intRow=1:1:^AOCD3 {
		s strRow=^AOCD3(intRow)
		s intLen=$L(strRow)
		s strTest=$E(strRow,1,(intLen/2))
		s strRest=$E(strRow,(intLen/2)+1,*)
		w:intVerb>3 strRow_": "_strTest_" - "_strRest,!
		
		for intLet=1:1:intLen 
		{
			s strLet=$E(strRest,intLet,intLet)
			I strTest[strLet
			{					
				S intVal=..getCodePriority(strLet)
				S intSum=intSum+intVal
				S ^AOCD3(intRow)=$LB(strRow,intTest,intRest,strLet,intVal)
				Q 
			}
		}
	}
	w "Total priority sum: "_intSum,!	
	Q intSum
}

ClassMethod initTest()
{
 k ^AOCD3
 S ^AOCD3=6
 S ^AOCD3(1)="vJrwpWtwJgWrhcsFMMfFFhFp"
 S ^AOCD3(2)="jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL"
 S ^AOCD3(3)="PmmdzqPrVvPwwTWBwg"
 S ^AOCD3(4)="wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn"
 S ^AOCD3(5)="ttgJtRGJQctTZtZT"
 S ^AOCD3(6)="CrZsJsPPZsGzwwsLwLmpwMDw"
}

ClassMethod initLive()
{
 k ^AOCD3
 S ^AOCD3=300
 S ^AOCD3(1)="JppMDcJPcQbqGqFb"
 S ^AOCD3(2)="ZStgnHtsSjGBhqFbBmsm"
 S ^AOCD3(3)="djzzwgHHggdnfwjtMPDPMGpPlNfpLDll"
 S ^AOCD3(4)="dRCtwtlCSttPtlNPNtgvPrDqmBsjGSpjBBsJsqqmrp"
 S ^AOCD3(5)="ZhWnZhzMMfnWWTDzBrmsmjsBccJB"
 S ^AOCD3(6)="TFQMrZrMfZrLZZnLQdlvNdCgdHPlCllHNF"
 S ^AOCD3(7)="PVddPnZWDDPqmHZzqVPzqdHdMRMJjQtvmvjvtTQQtlRtbbQl"
 S ^AOCD3(8)="fsNswFpChpNwfgtMvCbjTRJBbtRj"
 S ^AOCD3(9)="SFgfSMShLcsLgNMFhpwShFFZPHqZGZPqHdzPZHZcdzDDqd"
 S ^AOCD3(10)="dHffzCqSfJCCzCPvdcpzRrBDDBSBBBMtthDDrFMT"
 S ^AOCD3(11)="bVsZbsrgbWshBTFtDTtZTD"
 S ^AOCD3(12)="slWGNbNWgWwnmNnwgnlGjdJJdPHcvcrcHjqPzdqPvp"
 S ^AOCD3(13)="vBFBzGvGBvjFpGWcvCCvBvGPPhZbgLhMnhrPgFgPFgLLPF"
 S ^AOCD3(14)="dVlslfdJNVJJmQQwdNRNwLZZZrrqhbPbZndpdgMhLP"
 S ^AOCD3(15)="HJRHJpNJlVmftHfNQNRsHmmGCtGWjGDDTvCzcjWDStvcvT"
 S ^AOCD3(16)="cVQzCCCpVVjgHsNwwFRqSRSRRtNH"
 S ^AOCD3(17)="PWfhfPhbWWdWllPDdTvdbnvhLJLLMJFTSNwJtMRwJLqJJNMq"
 S ^AOCD3(18)="DnfblllPbDrbWmbdPFdvlhdgQzzZZzQgcpcsZGcGQQgcpr"
 S ^AOCD3(19)="hdFnnrdLnJRrZMzVlMbrwZvz"
 S ^AOCD3(20)="TgfjGCcfsqfqqBfRMPDVvVVvTZRPbP"
 S ^AOCD3(21)="qQqffcGStBSCQcsqCCBRjGqWhHFptFdnhNLmhnLWmphLLt"
 S ^AOCD3(22)="WHPqWhLWHBMqddCdtDRwStDSwgnw"
 S ^AOCD3(23)="rfCfZTmvpvvpFVfFrbvTbvcgtwgtStntggwbSJttgJtwgw"
 S ^AOCD3(24)="fpQFsmfFmfZcrFCMhWNQWLCzhhCM"
 S ^AOCD3(25)="zdqqJHDWwqNNZjQSmtdjpmfnjj"
 S ^AOCD3(26)="GFBcPfBLPThcTcLRbpTQQjpTQrjSnQjlvn"
 S ^AOCD3(27)="MFVLcsPVbPcRGfVPFRgDzJsHZNDCZNCNZsHg"
 S ^AOCD3(28)="WQdMhlmQMwfZlQdgdHfddvtzmbJbcsctbBJqqcvqzB"
 S ^AOCD3(29)="rSTrDDCSSGRCnnSGwwzJsbBvJsCCttccsvsz"
 S ^AOCD3(30)="VnFwDrNwPwVSDrLgjfZZdMQFMWgljQ"
 S ^AOCD3(31)="rJNjBLNQjvLQjFFLQJCFTvGWlRRgfGWDWlCDzlGnRRWG"
 S ^AOCD3(32)="tMMhShhwhbgplflwDlnnnzDH"
 S ^AOCD3(33)="ZcSZVMSqshhQBQqQvqQgjJ"
 S ^AOCD3(34)="btTtWGbvtcvHHccdNRhHdl"
 S ^AOCD3(35)="TDzqLPSqBzqVSldPddHhhNNlRQ"
 S ^AOCD3(36)="jBLDqDgZZBzJJmsbWjppmmpTWw"
 S ^AOCD3(37)="LLDTRRfTwZRGZfDCRTwRsVHsVFBVZVlmVFBFlFJl"
 S ^AOCD3(38)="QjWpQrzQcbhfMqrVVHVPFslFVpVmHH"
 S ^AOCD3(39)="hqhzqMfNvjvMMzhdRDdCwGDSSdnvRn"
 S ^AOCD3(40)="jmMdNCLjLmJPtHtSHhSVVJ"
 S ^AOCD3(41)="pDBqgBgCvbfGBBbCGHZhtQZtPHVSVHPV"
 S ^AOCD3(42)="pBnWgBpzWzBbWDWvzwpgCvqcmLNTrdLmmrnRLTrmrTdmLd"
 S ^AOCD3(43)="dRWWtRGBDPQctQDZ"
 S ^AOCD3(44)="CMfnCfFMmTTFVCmfmTLvsnMPZjccHRcPrRPsZQQZPQDRrQ"
 S ^AOCD3(45)="fLCffmRTCvRnmTllzVvpdpphNJggpGbJJJpdlh"
 S ^AOCD3(46)="cfsfbbWqqZqDScbhGDPDjTPmpVtmmPjPntFD"
 S ^AOCD3(47)="dCBBCRQCHNHLMQvrJJJBJLrGPMnjVtPjVMmnjPFmPmMpFn"
 S ^AOCD3(48)="HvRGLddgHHvqhwzbWhcgcf"
 S ^AOCD3(49)="DHmhhDDhbqrRhvbrHqhPbPvBwwWwTmMGTVwwBMGWVNNwVw"
 S ^AOCD3(50)="gSzJjnnjsscfcsZcSfWwQGdMMcWTBcTTMTMw"
 S ^AOCD3(51)="nsFCCFZsnSlCFBFflfflsztRPCqvvHPttRbHbhvPrrRr"
 S ^AOCD3(52)="SGNRLzpNpgNSNNlWFNwzqJfHfJHBtBdJhBJrHd"
 S ^AOCD3(53)="bQnjPTnjVdZtPPrfLP"
 S ^AOCD3(54)="TTnTccLnjGFcDNggFl"
 S ^AOCD3(55)="lBJmNzJlzmmQBlzgVVjLWRDfLjRsRLWWRS"
 S ^AOCD3(56)="vTMvTvtrfdhrrrPTdZwTTwtDqSSnWFWDFMMsRssjjsRqWD"
 S ^AOCD3(57)="ZpbvHbZddtbrdrdhcBmmpGQfBQgJNcmz"
 S ^AOCD3(58)="qsmhTmTVcDdcffhPhPvvzFhF"
 S ^AOCD3(59)="BNNlJbjWBWjtRtNljbmBBCpFzPlFPgpPfwFnlffnlPgg"
 S ^AOCD3(60)="JtBmmrrrRbDSrVqDqVSD"
 S ^AOCD3(61)="VmSgpSLgJjVDMrFrmMlfFmsG"
 S ^AOCD3(62)="bZWhZbzWcCwTWPRCwwwSPQzwMHnflHnGsMGnTrsflGMnlfTF"
 S ^AOCD3(63)="CqWhWqWCCWRRZQcLqDLpVDDLNStpgD"
 S ^AOCD3(64)="JwzTVzzcLzVJVVlJpVTwzGcrWhFjqsBjCjQFjWcCCjCjBF"
 S ^AOCD3(65)="MDSNQMtbSSnSbgbRDvnRNgvhmrqrjBCBtmCrCCWFqthhWm"
 S ^AOCD3(66)="bgMfNSSNZTwZQddGJZ"
 S ^AOCD3(67)="jjPgbFjjStjjPcSbrbtpvNrGnGDvBnMGvNDNGG"
 S ^AOCD3(68)="LwdZwsTdWTTmwDNCNppGBsnpBR"
 S ^AOCD3(69)="mWmHwZWhTTJWHBdQQWBjcFczSgjlSftjbtQPzg"
 S ^AOCD3(70)="fCBlrffzlCzcmfLDlfgRRnHScsHvRSQHMQvs"
 S ^AOCD3(71)="LthpZqtpVThZhGJtqTFvHsVnvsvMsggjHQjgQH"
 S ^AOCD3(72)="ZWFWGTLTWBNCWfDfmD"
 S ^AOCD3(73)="BpFqJrpcZZBDhDsNqMHhRG"
 S ^AOCD3(74)="zwlzPdmzPLhwvhMgsHnN"
 S ^AOCD3(75)="mPlWjlQfQjjllWtjQCWzCrBFJFTBcSNcJbbZfcZJSb"
 S ^AOCD3(76)="FpzNFTThBDChnnzNBCBNDzWGndgWqbJWVGqmPbJqQgQm"
 S ^AOCD3(77)="HQRctcvwgddVcJGd"
 S ^AOCD3(78)="LwRMZLjQfSRjFNzFSrhNsThS"
 S ^AOCD3(79)="WgRWVLWhFqgqgcgWHqLRWHVRbbbNwBmtBcNcwdwwBNwBzwBN"
 S ^AOCD3(80)="pSfssjDSrSvJpNJCztbJBtMNbt"
 S ^AOCD3(81)="TzsvGGnjGPsPjSTpDrPfPDSHhWqLgZZVHVhZZZZVQQFLnZ"
 S ^AOCD3(82)="sHjtPjQTtDbsfrrqWR"
 S ^AOCD3(83)="ZmccchvlvSvvZNMVNhvBLWRJJblWJWJlJfwHbwlL"
 S ^AOCD3(84)="hMMBzSMppVSzSNNmNgHjPgGPFTCpTTgTgG"
 S ^AOCD3(85)="rPQpCPPCQQZdcFhcZgzVJgwt"
 S ^AOCD3(86)="vDBSHmvHSSMlDWWmljnHBvFwzzcrwhVSJwVFtzcJJghw"
 S ^AOCD3(87)="bmmrsrsbsvNdCTdbPTdb"
 S ^AOCD3(88)="NgzBnsBNnfjgNvvfvWbtShSSFSMLJMFjjbPh"
 S ^AOCD3(89)="CCcRHdlQrQPLTJPLGP"
 S ^AOCD3(90)="HrDlRcqcDJCCDJHlcplrDJDfgfzBWWNZfvsnNqWwngZWwW"
 S ^AOCD3(91)="TggFVbjVTVzRwFFjjqBBqpzNztqcQqNNqN"
 S ^AOCD3(92)="SnZPrWndmShSZSPsnSLsJhpMQpcJtNqBClltqctC"
 S ^AOCD3(93)="mfWsGdnZZWmZmrLSfsrnmPggwtggRgGTVHvRwgFDjTGT"
 S ^AOCD3(94)="wQMZFQwppbPHPbLQJsgQNJJmBnds"
 S ^AOCD3(95)="qrSGvRRCvTzTDNnhNgmCgdBm"
 S ^AOCD3(96)="qzRrcRlGjvvzlzrvjcGqSSzMHWwVdPMWFpFMHMHWlPWMVV"
 S ^AOCD3(97)="BccsFzrBcsfpccccgFmQqlGNqCTLTlQnqgLlRG"
 S ^AOCD3(98)="MZbVSMddddSPPtdHPVJPJdTllqLNLGGTNCCRhTnHTQHh"
 S ^AOCD3(99)="DMwtbVZDZbSbpprcpccppwrq"
 S ^AOCD3(100)="bSZTdNqFjjzjqQMQ"
 S ^AOCD3(101)="WtRztLsWJpPLzrsMDlDQjMhVMC"
 S ^AOCD3(102)="pcgHRpHmWPJgLRzBJHBPPRBfvvfGNGvvFwfvSvfTmNNZfN"
 S ^AOCD3(103)="RjvBljWTTWTlqmBvHjGptRgccZcbPtcttbpzbn"
 S ^AOCD3(104)="VhDSDdJLJpSNNVVznPzzzSzcZFngZt"
 S ^AOCD3(105)="LsMdQNVMHsBHjqps"
 S ^AOCD3(106)="rSPSLTnSCClfSFCR"
 S ^AOCD3(107)="MwtZgwNBzzTjzZMbbmjNtwmBcRvFqQllqtQRlFRVqRqVVcvq"
 S ^AOCD3(108)="TsMhZsjNjBbTbBbwZLpDnHdDGdHWnpGHnh"
 S ^AOCD3(109)="LfdssTFBjFHSwlhzCcZZgMMfMhZZ"
 S ^AOCD3(110)="DmtDvrpmNStVvqpPczrZMMhZhhChCC"
 S ^AOCD3(111)="vJtJpQWvNVDtJFbHlJSlBbSF"
 S ^AOCD3(112)="PgvHLbcgRcGGHzRvgGgchBzsCZnmNZmZddrCrvdddZCZrF"
 S ^AOCD3(113)="JQBMjlStJrQsZFrNCZ"
 S ^AOCD3(114)="JSJTlqMtjptlplSSqJVDBqphwhhwHRPRggGbGzHbgzVRPH"
 S ^AOCD3(115)="pBsztsZdBsnWhntVnhtVTqTWNQlGGTGGFFlQFlTl"
 S ^AOCD3(116)="fDvLSMcbDbfMrGqFqSGwSQPzqz"
 S ^AOCD3(117)="zjcvLMMvffLjgggzfjjJCCLcdBtRphddBmmZBpCZZpZpmmhs"
 S ^AOCD3(118)="gmmSDplcPHDfHDlbVNrtCtCCNqHvTn"
 S ^AOCD3(119)="QGwJjzdPMzJhFLwnbvMqrTVCCMnvMv"
 S ^AOCD3(120)="LQQZdGjGdJhFBFQGjLGBJzzsBSWcPflllcfmDmfBsmBWPs"
 S ^AOCD3(121)="sMppbLDRMQbrTDTJjwcqnfnjwwnw"
 S ^AOCD3(122)="CgmFgSPHPzHgdmJWZZFzCzZZcVnGGnttWtVVVnccfjVqwVff"
 S ^AOCD3(123)="PhCChPSNgPgPJhPHhFZgsDNRspsvMNQLRvNDvpbD"
 S ^AOCD3(124)="pHnVnlRGVpfgpfgCpCTz"
 S ^AOCD3(125)="LCNQPqZCqNSSZCStzPgTmztwPfzwzT"
 S ^AOCD3(126)="dbSqhjhqQhNLQLFjLjGvFcRnCcsvRVvvsFnG"
 S ^AOCD3(127)="QTdnDTDQbCnMdbqdwSmJBljFJZhttJZMSh"
 S ^AOCD3(128)="HfNfLNzGLsgWBpGJthlZFBSB"
 S ^AOCD3(129)="ssRPHPfNsWHzZZvrvHfgLzNwnbbVVRwwRbVVcqDTddCVdD"
 S ^AOCD3(130)="ZhZBrJssjrNsbRtWpjwjlmlm"
 S ^AOCD3(131)="qTfHzGTfTGqqLGMdCCRcmmRRZcbPMccWmcRw"
 S ^AOCD3(132)="dVCZdDHdGHQhBVNJSsBhBF"
 S ^AOCD3(133)="NsplbGDbblHcbCpDlDGDPlPpJjdrVjgrvHnghvVdJrJdvvdn"
 S ^AOCD3(134)="tQFMZNWSmWFQRzQSwtzFmwFFJdVBghVrnBjVjBgrvVjMvrhJ"
 S ^AOCD3(135)="FFRmFZZRzQRmFLQSZZWQWFCPCNGcTCpGpfGfLTpblpff"
 S ^AOCD3(136)="dnhQHqQCnqWwNQCwCRRdJjjJVVPmVVJsJP"
 S ^AOCD3(137)="LccFRDgfMgLFBJVlmVVmgjrPzZ"
 S ^AOCD3(138)="pvfGpRpSpTnTQbvbTv"
 S ^AOCD3(139)="nwNlWwhWwNmJvQQdzdzZGMqDzn"
 S ^AOCD3(140)="rcVscPfrLcfvjTFcQDqGdZqMzMSHZHjS"
 S ^AOCD3(141)="LsfbbFcvVgRRblJRNR"
 S ^AOCD3(142)="Rmrrlmltcffhllfl"
 S ^AOCD3(143)="DDZMMMFZVsFsWZDSHhPPfgQbPPnQgcHctf"
 S ^AOCD3(144)="zGMGSBVDWCrvwjtBvm"
 S ^AOCD3(145)="DCZHwdDwNNGNZDZCjjtpTHLvtlgLbRLttlTL"
 S ^AOCD3(146)="BzPzBJffJJQgLlRgGztQ"
 S ^AOCD3(147)="PJffcJhJfNNSwFhGZC"
 S ^AOCD3(148)="blplfHbwZSfbcbwSbfVSHDHcNvdrvrWsCrvWVCRWnvNndtWW"
 S ^AOCD3(149)="hQzBTQLLMBWBsnsnNC"
 S ^AOCD3(150)="zMsgTjqTqPpZHbfp"
 S ^AOCD3(151)="ZLNNLtfZhRJQtpQhNRttZRqcGFcqGBzjrcqclGScFljjcj"
 S ^AOCD3(152)="VnvVVPMWHwgJCMvwdcGFdFrGcwzGBG"
 S ^AOCD3(153)="WHgPJJvWVTgnvgvTHmWCHmsNZRtNRDZpfZQffZZssR"
 S ^AOCD3(154)="rZgMFMVVjGbVSqZbhftLRDmCGRCNDCtm"
 S ^AOCD3(155)="cdddQzdWsWnQvzscnfRHmfnDNtLNChRmfH"
 S ^AOCD3(156)="zplDQdDzwszlDsWdPcldzMFFrFrBFgpqVBZgSgZFrF"
 S ^AOCD3(157)="gbzfbTvbJgbvzvTvJvJmzvjcBBQSfWDLCSBQQfLZWSCdBHHD"
 S ^AOCD3(158)="GhnMhsGrMNPPwnwsRPNsFCZDWHZdWBWHdrZLdCHBBC"
 S ^AOCD3(159)="PsnGsssGNsNRFsLGwMVNccJVmbjcjJblbzTVjlTz"
 S ^AOCD3(160)="RfBqNfVmPLTTTVRZMMBWjlMvBgbbMs"
 S ^AOCD3(161)="rHJzDwJdHzQgbMQlWMhd"
 S ^AOCD3(162)="HtJrpCcHflLPFfpq"
 S ^AOCD3(163)="SSGtmjQFStDbQbqGWJNnpZwgPsZjnJNNfZ"
 S ^AOCD3(164)="RdClRMhlldHdlvdThNgwfJNRspNwJpwZcN"
 S ^AOCD3(165)="CMBLgvvBLhrrBHTCVVLBQrWtbrDGmbtWGtzDQFGb"
 S ^AOCD3(166)="ZRRCqHpRdztLSqWz"
 S ^AOCD3(167)="hRsGjMVccGshPVDVcBmfgFFzggFgfBmWWtSd"
 S ^AOCD3(168)="PVjlGhcGJjGPsGMjjDVrMTpRnvRZlHnZNNQbHppTTC"
 S ^AOCD3(169)="QjbjWWlndRbwwwQWQdtpTVVZtzRPhHDzThhP"
 S ^AOCD3(170)="fFfLsvrLCrmvGlSfLSrlPHThDzTztHVtzDzGtTVh"
 S ^AOCD3(171)="fvrgsfccFLLLSvfMCCSWBjdMqdqNWBdBQNnWld"
 S ^AOCD3(172)="pjGPvvbllvqGvGjwMbpbRmgSmSwtRtShgSSWWQmW"
 S ^AOCD3(173)="DffTZLLzFFFTCRJMhWBzhmhgJt"
 S ^AOCD3(174)="CVVZLLTTsZTFCnMffMTFHffLVpGpNqGjNbNPljqVPcGNGlcv"
 S ^AOCD3(175)="rvJfztqQJqqrqHHwCzClTbBhDBBDrbSgphbVTrrV"
 S ^AOCD3(176)="FFGdNWFLGWMmLDbpRwVbgRBp"
 S ^AOCD3(177)="dmNGmZjMjQwtHCCw"
 S ^AOCD3(178)="MSGbqbqMbbGDhSSGDhLNBPNcrDPPfzfczPfrnv"
 S ^AOCD3(179)="rRwsrljslRgslwwgpssCjRtBNvnmPmBmccvmPnmzcP"
 S ^AOCD3(180)="CjVjsssJQpTCrCCgHJLMSZbhMhWGZhHG"
 S ^AOCD3(181)="JtBGBFGRVGVLLctRttthLFRBDQlDppljJwNQlpHHQqDHbHHN"
 S ^AOCD3(182)="szSZTrzdzTSMdzsmsqqQqwdbgDNqgQNjlN"
 S ^AOCD3(183)="SzmrlWPrlfPMsMZTPtCVCFRhhvhccLFPvL"
 S ^AOCD3(184)="chmbsMDMMcBnGbZBzZGL"
 S ^AOCD3(185)="JjjgJrJJggNgtrQSQBLjWBZlGnnB"
 S ^AOCD3(186)="rFNrFtFCRNVrrsHmMDcsLqMhMF"
 S ^AOCD3(187)="DLMwrBGgrBBDrcBcNBgWhpGhqVhhqSjqqqmjjp"
 S ^AOCD3(188)="JfJCZCdtlbZlHHbjWVpPmHWb"
 S ^AOCD3(189)="lTtZtnFQCztWFzJflZLcsrLFNDRNBcswcLMM"
 S ^AOCD3(190)="tsVttVCBsCcCqPqwvtqNPQjWDDWjzQQWnpJQSrWJJN"
 S ^AOCD3(191)="LMRdZvHGgMmZZGGLGLbhLhJpjWrSjndWJpSJrJppJnpj"
 S ^AOCD3(192)="RhRgLMlmgMGMFGLlTtcBvwcfFCtVvfFT"
 S ^AOCD3(193)="llBBmtncBglfqwsdwsjdbHwQHm"
 S ^AOCD3(194)="zGRhPJvFzhvFvMDGFvGPwSWWQpdpHSwSjWjHsWMw"
 S ^AOCD3(195)="JGFhDPrLTzhLhvFPzPjLjTzFlBqltnCqqBffcTgfnZfCfCnB"
 S ^AOCD3(196)="QWQGNHQBffCNDMPdRTDLPVMN"
 S ^AOCD3(197)="hrtlhtzZwJtwwgFgtlJthJJtZMqPVVpLmDVqRDmVPmMPVRTV"
 S ^AOCD3(198)="SJSSnJwJlsFFvcHSBbfLQHGL"
 S ^AOCD3(199)="zMNVzhNFsdNssmhlvtQvlttBlVGbTt"
 S ^AOCD3(200)="wHpFwjHjLFHlwtncTQlnwn"
 S ^AOCD3(201)="CCpjpqLCLqJggghqRmFsNRFmPszh"
 S ^AOCD3(202)="CTjmprmNcnmCNVQbstnstvbnQv"
 S ^AOCD3(203)="jqqdGhHgPRdfRRQvfLQffz"
 S ^AOCD3(204)="BGgqBhMdgqBHMDDqqMPwgdhSTJNjjmJWWCTCCmwTWZNpmZ"
 S ^AOCD3(205)="LqSDFFmdqDBDbbBHWl"
 S ^AOCD3(206)="dQcRpgwRQPngBWHbVWht"
 S ^AOCD3(207)="vdQMJQCQQvrJNqrTNsSZSmZT"
 S ^AOCD3(208)="cqrHcHHFNFPLLNPHLWnHHFHFjvlbZfWjSjBjZfSblhbBSbSf"
 S ^AOCD3(209)="VdVTGwTzTwTpMJslvjfsbbZSvnBClj"
 S ^AOCD3(210)="nJdGmmTpTTdmNQNNLPPmDFQL"
 S ^AOCD3(211)="VcjpTTtpcbThJBTTcjBvSPJzJlvPlwfJrgrgvw"
 S ^AOCD3(212)="dmshCNqnqdhmRsCsqCnrNgPPrPfzrNLfSwSgzl"
 S ^AOCD3(213)="ddQZdFnhsMttFTbDDD"
 S ^AOCD3(214)="hLThMTSdfMzzLzTLsFTbwtDvtsFTnttF"
 S ^AOCD3(215)="pZlNllPWrPCQPQlWNqjrqrjsnfDFbbtbstwswtvDnwtwjt"
 S ^AOCD3(216)="pCNNQBCClQrplrfHQpQdSRMSVRhJzRchRhGHSh"
 S ^AOCD3(217)="RZfVfRnTcPQWZcRVcRNSvljQsSSjNvvNqvss"
 S ^AOCD3(218)="pwbwgmqJhGlNvvzgMM"
 S ^AOCD3(219)="pthrhpmthmwhHHpLbbdrJmLWWRPTRZnCnPCPBnWTWTZq"
 S ^AOCD3(220)="nzsJJsMjGMMsQFbnNmLnmCfb"
 S ^AOCD3(221)="HlllPPTPlWTPDRRDRHcwwhrLLZfQmgmmQCFHvNZCgfggZQ"
 S ^AOCD3(222)="lPcNTwNWddGsMSttdjzj"
 S ^AOCD3(223)="bTbJZJDVFdqpBZTFTZJprdcsjjGszmjQszcjzDvsgccv"
 S ^AOCD3(224)="HHLnhMNCCPhfhCLMlPlnvgGfctscSvtSjGjztQtm"
 S ^AOCD3(225)="wWNQMPPMwlPHHPnnRLwWpJbrbbqbdppqJVJdZV"
 S ^AOCD3(226)="gpgpNnnrhwBVWFqgjqqF"
 S ^AOCD3(227)="ZCTsdRbCGZpZzCSGbWmtMBmWtqBBqdjjmq"
 S ^AOCD3(228)="LcsTSlplZrJNcQQPvH"
 S ^AOCD3(229)="DJDpMcqJDcDddNcJPGcJGFfnfZZmZZfRQZRNmVQVnBNn"
 S ^AOCD3(230)="WWThvSSHFshlSsHvgTHLlzBQfVWwmwnnfmRQWnQVRn"
 S ^AOCD3(231)="vljlgHjhstHbLhjLjrbPqMGJcJFJCMPrdF"
 S ^AOCD3(232)="pJlPMpMBrrMcnrBBMMrvdhdgFvmcFdWtmdtftg"
 S ^AOCD3(233)="bVVRmTRVTVVSVVVzZZqsggFHWTWtWffWFfWdtHdH"
 S ^AOCD3(234)="RjLQDSzmVsjRRZSZQrCMJDPwlnJJnGGrPB"
 S ^AOCD3(235)="GRgJtglPGlCrhQQrfW"
 S ^AOCD3(236)="vSjvZvZHNBjZSvwjvmvNDqhhFqhHrMhrHpfWqQfhpW"
 S ^AOCD3(237)="NBmwDSbZbvsNNBjmZfJzJgbVnGJbzVzPVRtL"
 S ^AOCD3(238)="QQZVQCdlVmdZnWmJBrLwSJRdggwdJr"
 S ^AOCD3(239)="DqHhPhcpvDqPFjhHjtFPssSJNfSBwBvffrgJwwJLBJbr"
 S ^AOCD3(240)="jpsHcptHsqtPttsjctpFhGlZwCMlWMmWGCWVQnTMVWmz"
 S ^AOCD3(241)="zzvnHjHWSfnvzpnfSRHdgrrsmWmhVrrwwbTrTmsrwm"
 S ^AOCD3(242)="NlLNGqqclqlZZCLCGGCPllJhhPJbrmpmrwVshFVsJbwr"
 S ^AOCD3(243)="DMLDNCZQCGLQGDtQpGtMjRdfdSRSSBtjtBjfjgjS"
 S ^AOCD3(244)="WBBJfjBQJjftGCbttVJptC"
 S ^AOCD3(245)="sdlmTHsqNsqpRtGcbWdbnR"
 S ^AOCD3(246)="svNMhmWHNmvmvHZWTvBQDgSSjDFPSBSFPP"
 S ^AOCD3(247)="mrlgqncgwHdqWWhRNtRttSvbRwwSvN"
 S ^AOCD3(248)="jZLCZVZzVcCTcpCDVSBBSbvvRFbfDBSDNS"
 S ^AOCD3(249)="VPJVpQjTZLjVLJJQGZTZGcQVghsGlmhshlqnghqrdrgldhlW"
 S ^AOCD3(250)="qwGDMqMFWbFbqbDwMgqgnjfnffffcTTjNnpTfBncZZ"
 S ^AOCD3(251)="lSdclSltlzPsJlhNNfTQPTmQhpPh"
 S ^AOCD3(252)="LtllsscLLLvvJlSzWGqwrDGqvbqMwMGb"
 S ^AOCD3(253)="bnfvnnQsVTdHQDmdNN"
 S ^AOCD3(254)="fwlttwrfSfLwdGZGmGND"
 S ^AOCD3(255)="qlPrjjplfSpjSltfttBBsvgzgbgnggBqWVvC"
 S ^AOCD3(256)="HHrBSmBqBHdHCFcQsc"
 S ^AOCD3(257)="WqtMDDnMMZhMhcsQVM"
 S ^AOCD3(258)="bqtbGDLLTTnRPwvGgBNmNrwvjm"
 S ^AOCD3(259)="RwWzWFwBcdSdMgJW"
 S ^AOCD3(260)="mrTjVQDQthQvjrvTmggFbbdgSJcJDFgSdg"
 S ^AOCD3(261)="phhFtvjNvFvTTvmTHZzlGlzZRZLBlzRp"
 S ^AOCD3(262)="cHlZmZmJSHZcTVGmvZVcGVHlNtbDNbtWFWdtlbCWbWtQDFdr"
 S ^AOCD3(263)="pwfwgRhngPjjtdWdNtFrdFwT"
 S ^AOCD3(264)="RTgMpfhBcMJGHqcz"
 S ^AOCD3(265)="dmCbpCLQVFmCRddCTFLCgZtWPNBhSNNwZWgWZvSwhN"
 S ^AOCD3(266)="rDzGDjJHhhwzThBS"
 S ^AOCD3(267)="rJrclsjjsJMJnJMLnbQQQFmRTqLVRT"
 S ^AOCD3(268)="TgFTGPtrWHzgCJDz"
 S ^AOCD3(269)="fQbfLwbbFbWjHJHWjd"
 S ^AOCD3(270)="LvQvwVfQvQhLLLLsmMBfLfBhqchtGFSNSFNqrSqPcqSGttSN"
 S ^AOCD3(271)="MsMmFgTVMMgMdFVMhdzWqCCBCWjWqBWqhzzL"
 S ^AOCD3(272)="nHfZDlbvcrDpcpcfDJbNJqGLbCjBmjLzJC"
 S ^AOCD3(273)="RnDZHwmmTwVMTsMS"
 S ^AOCD3(274)="NpdpdnjNCRjBnHRPpBDnhSdSwFFLFdScFFWcFWLd"
 S ^AOCD3(275)="stqMrMZtsQMJmMqvrtqMbstQVchPFWgFVVFVwfWJcSSWVSSV"
 S ^AOCD3(276)="MQrZzbvMrrrZZtZmstMtMsDRRjPHCGTjBnzpnDHTCGjG"
 S ^AOCD3(277)="ClGGvDMGMNhNSmFVPbpgFgmFgZPb"
 S ^AOCD3(278)="WhTTLWsBBWTcrPpggtQpsQFpVb"
 S ^AOCD3(279)="fBRTqWLjTrzDNhMvCSGDzl"
 S ^AOCD3(280)="jbzjttVzpbWzWVbTtzWzVwPbPPcwDDccccFNFLMFsm"
 S ^AOCD3(281)="rlghJZHmCHvHJvRLSNLhhhccNPwcMP"
 S ^AOCD3(282)="QffmBZRBGtVTBdTG"
 S ^AOCD3(283)="bDRqHwwRpNPnbppn"
 S ^AOCD3(284)="FqrlQSQJSVsQrSCmpdPNpcNCcP"
 S ^AOCD3(285)="jFZjrssjBhrZVhJLLGHfMHfwtqRjMqRTvD"
 S ^AOCD3(286)="SMMCTBzFfSRhTThCSMRSzzHnJgqGDHQgGVDnqrqnqqnqcQ"
 S ^AOCD3(287)="ljvjpWPbrWWtrbmDVDlmnDnqVmgJ"
 S ^AOCD3(288)="bNjsNPrNPtswfZzfTSTBwhSM"
 S ^AOCD3(289)="hNMNdssdMqdTQchqgNZzHtwmwGHHzmQZGHDH"
 S ^AOCD3(290)="JrbJvJrvLrPjrPCVCjRBLPbzfRFZmzwHgFHmGHmwFwzFZR"
 S ^AOCD3(291)="rpbrvVjPCBbCJrCSLSPsTlphNncMglcNTMWMql"
 S ^AOCD3(292)="fGWGHbrllCCWWllFNPQSZvdPSvdZTffZ"
 S ^AOCD3(293)="tqssVjJMJWzWVvSvWS"
 S ^AOCD3(294)="qtwMwDWjnRRwssWjngwjjnhhDcCLhhCFHlcmcbCHFmDC"
 S ^AOCD3(295)="rFTdFjdRDTTlDWCqvhwLhwZdLS"
 S ^AOCD3(296)="QzfJfnfsbsJHMnNmHhVpCZwSQSWqSqVQhS"
 S ^AOCD3(297)="nJnczsHzNMmBJnbnbNwnfzJfcDTltllRTgPlFlgPrTDjPRGl"
 S ^AOCD3(298)="ZLCGDvvJlvGChSPZWPSsZWdRRN"
 S ^AOCD3(299)="rQccBwcccnHmQggnVLPLWpgVWPpWzSRs"
 S ^AOCD3(300)="fmwTfTHnMBTfJDbfftJLvhlL"
}

}
