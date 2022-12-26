Class MC2022AOC.Day10 [ Abstract ]
{

ClassMethod runGame2(intLive As %Integer = 1, intVerb As %Integer = 0) As %Integer
{
	I intLive=1
	{ d ..initLive() }
	ELSE 
	{ d ..initTest() }
	
	S (intCount)=0
	S intClick=1	
	S intX=1
	S aClicks=""
		
	
	// init the click array
	for intRow=1:1:^AOCD10 {
		S intAction=$P(^AOCD10(intRow)," ",1)
		I intAction="noop" {
			S aClicks(intClick)=intX
			s intClick=intClick+1
		} else {
			S intParam=$P(^AOCD10(intRow)," ",2)
			S aClicks(intClick)=intX
			s intClick=intClick+1
			S aClicks(intClick)=intX
			s intClick=intClick+1
			S intX = intX+intParam
		}
	}	
	
	s intCol=0
	s intRow=0
	for intRow=0:1:5
	{
		S sRow(intRow)=""
		for intCol=0:1:39
		{
			S intCycle=(intRow*40)+intCol+1
			w intRow_","_intCol_": "_aClicks(intCycle)_" -> "_(intCol)_" Match: "_(aClicks(intCycle)=intCol),!
			I ((aClicks(intCycle)=intCol)||(aClicks(intCycle)=(intCol+1))||(aClicks(intCycle)=(intCol-1)))
			{ w "T:"
			S sRow(intRow)=sRow(intRow)_"#" }
			ELSE 
			{ W "F:"
			S sRow(intRow)=sRow(intRow)_"." }						
		}	
		w !
	}
	
	F i=0:1:5
	{
		W sRow(i),!	
	}
}

ClassMethod runGame(intLive As %Integer = 1, intVerb As %Integer = 0) As %Integer
{
	I intLive=1
	{ d ..initLive() }
	ELSE 
	{ d ..initTest() }
	
	S (intCount)=0
	S intClick=1	
	S intX=1
	S aClicks=""
		
	// init the click array
	for intRow=1:1:^AOCD10 {
		S intAction=$P(^AOCD10(intRow)," ",1)
		I intAction="noop" {
			S aClicks(intClick)=intX
			s intClick=intClick+1
		} else {
			S intParam=$P(^AOCD10(intRow)," ",2)
			S aClicks(intClick)=intX
			s intClick=intClick+1
			S aClicks(intClick)=intX
			s intClick=intClick+1
			S intX = intX+intParam
		}
	}
	
	//20th, 60th, 100th, 140th, 180th, and 220th cycles
	w "20th "_aClicks(20)_" => "_(aClicks(20)*20),!
	w "60th "_aClicks(60)_" => "_(aClicks(60)*60),!
	w "100th "_aClicks(100)_" => "_(aClicks(100)*100),!
	w "140th "_aClicks(140)_" => "_(aClicks(140)*140),!
	w "180th "_aClicks(180)_" => "_(aClicks(180)*180),!
	w "220th "_aClicks(220)_" => "_(aClicks(220)*220),!

	s intCount = (aClicks(20)*20)+(aClicks(60)*60)+(aClicks(100)*100)+(aClicks(140)*140)+(aClicks(180)*180)+(aClicks(220)*220)
	
	Q intCount
}

ClassMethod initTest()
{
 k ^AOCD10
 
 S ^AOCD10=146 
 S ^AOCD10(1)="addx 15"
 S ^AOCD10(2)="addx -11"
 S ^AOCD10(3)="addx 6"
 S ^AOCD10(4)="addx -3"
 S ^AOCD10(5)="addx 5"
 S ^AOCD10(6)="addx -1"
 S ^AOCD10(7)="addx -8"
 S ^AOCD10(8)="addx 13"
 S ^AOCD10(9)="addx 4"
 S ^AOCD10(10)="noop"
 S ^AOCD10(11)="addx -1"
 S ^AOCD10(12)="addx 5"
 S ^AOCD10(13)="addx -1"
 S ^AOCD10(14)="addx 5"
 S ^AOCD10(15)="addx -1"
 S ^AOCD10(16)="addx 5"
 S ^AOCD10(17)="addx -1"
 S ^AOCD10(18)="addx 5"
 S ^AOCD10(19)="addx -1"
 S ^AOCD10(20)="addx -35"
 S ^AOCD10(21)="addx 1"
 S ^AOCD10(22)="addx 24"
 S ^AOCD10(23)="addx -19"
 S ^AOCD10(24)="addx 1"
 S ^AOCD10(25)="addx 16"
 S ^AOCD10(26)="addx -11"
 S ^AOCD10(27)="noop"
 S ^AOCD10(28)="noop"
 S ^AOCD10(29)="addx 21"
 S ^AOCD10(30)="addx -15"
 S ^AOCD10(31)="noop"
 S ^AOCD10(32)="noop"
 S ^AOCD10(33)="addx -3"
 S ^AOCD10(34)="addx 9"
 S ^AOCD10(35)="addx 1"
 S ^AOCD10(36)="addx -3"
 S ^AOCD10(37)="addx 8"
 S ^AOCD10(38)="addx 1"
 S ^AOCD10(39)="addx 5"
 S ^AOCD10(40)="noop"
 S ^AOCD10(41)="noop"
 S ^AOCD10(42)="noop"
 S ^AOCD10(43)="noop"
 S ^AOCD10(44)="noop"
 S ^AOCD10(45)="addx -36"
 S ^AOCD10(46)="noop"
 S ^AOCD10(47)="addx 1"
 S ^AOCD10(48)="addx 7"
 S ^AOCD10(49)="noop"
 S ^AOCD10(50)="noop"
 S ^AOCD10(51)="noop"
 S ^AOCD10(52)="addx 2"
 S ^AOCD10(53)="addx 6"
 S ^AOCD10(54)="noop"
 S ^AOCD10(55)="noop"
 S ^AOCD10(56)="noop"
 S ^AOCD10(57)="noop"
 S ^AOCD10(58)="noop"
 S ^AOCD10(59)="addx 1"
 S ^AOCD10(60)="noop"
 S ^AOCD10(61)="noop"
 S ^AOCD10(62)="addx 7"
 S ^AOCD10(63)="addx 1"
 S ^AOCD10(64)="noop"
 S ^AOCD10(65)="addx -13"
 S ^AOCD10(66)="addx 13"
 S ^AOCD10(67)="addx 7"
 S ^AOCD10(68)="noop"
 S ^AOCD10(69)="addx 1"
 S ^AOCD10(70)="addx -33"
 S ^AOCD10(71)="noop"
 S ^AOCD10(72)="noop"
 S ^AOCD10(73)="noop"
 S ^AOCD10(74)="addx 2"
 S ^AOCD10(75)="noop"
 S ^AOCD10(76)="noop"
 S ^AOCD10(77)="noop"
 S ^AOCD10(78)="addx 8"
 S ^AOCD10(79)="noop"
 S ^AOCD10(80)="addx -1"
 S ^AOCD10(81)="addx 2"
 S ^AOCD10(82)="addx 1"
 S ^AOCD10(83)="noop"
 S ^AOCD10(84)="addx 17"
 S ^AOCD10(85)="addx -9"
 S ^AOCD10(86)="addx 1"
 S ^AOCD10(87)="addx 1"
 S ^AOCD10(88)="addx -3"
 S ^AOCD10(89)="addx 11"
 S ^AOCD10(90)="noop"
 S ^AOCD10(91)="noop"
 S ^AOCD10(92)="addx 1"
 S ^AOCD10(93)="noop"
 S ^AOCD10(94)="addx 1"
 S ^AOCD10(95)="noop"
 S ^AOCD10(96)="noop"
 S ^AOCD10(97)="addx -13"
 S ^AOCD10(98)="addx -19"
 S ^AOCD10(99)="addx 1"
 S ^AOCD10(100)="addx 3"
 S ^AOCD10(101)="addx 26"
 S ^AOCD10(102)="addx -30"
 S ^AOCD10(103)="addx 12"
 S ^AOCD10(104)="addx -1"
 S ^AOCD10(105)="addx 3"
 S ^AOCD10(106)="addx 1"
 S ^AOCD10(107)="noop"
 S ^AOCD10(108)="noop"
 S ^AOCD10(109)="noop"
 S ^AOCD10(110)="addx -9"
 S ^AOCD10(111)="addx 18"
 S ^AOCD10(112)="addx 1"
 S ^AOCD10(113)="addx 2"
 S ^AOCD10(114)="noop"
 S ^AOCD10(115)="noop"
 S ^AOCD10(116)="addx 9"
 S ^AOCD10(117)="noop"
 S ^AOCD10(118)="noop"
 S ^AOCD10(119)="noop"
 S ^AOCD10(120)="addx -1"
 S ^AOCD10(121)="addx 2"
 S ^AOCD10(122)="addx -37"
 S ^AOCD10(123)="addx 1"
 S ^AOCD10(124)="addx 3"
 S ^AOCD10(125)="noop"
 S ^AOCD10(126)="addx 15"
 S ^AOCD10(127)="addx -21"
 S ^AOCD10(128)="addx 22"
 S ^AOCD10(129)="addx -6"
 S ^AOCD10(130)="addx 1"
 S ^AOCD10(131)="noop"
 S ^AOCD10(132)="addx 2"
 S ^AOCD10(133)="addx 1"
 S ^AOCD10(134)="noop"
 S ^AOCD10(135)="addx -10"
 S ^AOCD10(136)="noop"
 S ^AOCD10(137)="noop"
 S ^AOCD10(138)="addx 20"
 S ^AOCD10(139)="addx 1"
 S ^AOCD10(140)="addx 2"
 S ^AOCD10(141)="addx 2"
 S ^AOCD10(142)="addx -6"
 S ^AOCD10(143)="addx -11"
 S ^AOCD10(144)="noop"
 S ^AOCD10(145)="noop"
 S ^AOCD10(146)="noop"
}

ClassMethod initLive()
{
 k ^AOCD10
 
 S ^AOCD10=139
 
 S ^AOCD10(1)="addx 1"
 S ^AOCD10(2)="noop"
 S ^AOCD10(3)="noop"
 S ^AOCD10(4)="noop"
 S ^AOCD10(5)="addx 5"
 S ^AOCD10(6)="addx 5"
 S ^AOCD10(7)="noop"
 S ^AOCD10(8)="noop"
 S ^AOCD10(9)="addx 9"
 S ^AOCD10(10)="addx -5"
 S ^AOCD10(11)="addx 1"
 S ^AOCD10(12)="addx 4"
 S ^AOCD10(13)="noop"
 S ^AOCD10(14)="noop"
 S ^AOCD10(15)="noop"
 S ^AOCD10(16)="addx 6"
 S ^AOCD10(17)="addx -1"
 S ^AOCD10(18)="noop"
 S ^AOCD10(19)="addx 5"
 S ^AOCD10(20)="addx -2"
 S ^AOCD10(21)="addx 7"
 S ^AOCD10(22)="noop"
 S ^AOCD10(23)="addx 3"
 S ^AOCD10(24)="addx -2"
 S ^AOCD10(25)="addx -38"
 S ^AOCD10(26)="noop"
 S ^AOCD10(27)="noop"
 S ^AOCD10(28)="addx 32"
 S ^AOCD10(29)="addx -22"
 S ^AOCD10(30)="noop"
 S ^AOCD10(31)="addx 2"
 S ^AOCD10(32)="addx 3"
 S ^AOCD10(33)="noop"
 S ^AOCD10(34)="addx 2"
 S ^AOCD10(35)="addx -2"
 S ^AOCD10(36)="addx 7"
 S ^AOCD10(37)="addx -2"
 S ^AOCD10(38)="noop"
 S ^AOCD10(39)="addx 3"
 S ^AOCD10(40)="addx 2"
 S ^AOCD10(41)="addx 5"
 S ^AOCD10(42)="addx 2"
 S ^AOCD10(43)="addx -5"
 S ^AOCD10(44)="addx 10"
 S ^AOCD10(45)="noop"
 S ^AOCD10(46)="addx 3"
 S ^AOCD10(47)="noop"
 S ^AOCD10(48)="addx -38"
 S ^AOCD10(49)="addx 1"
 S ^AOCD10(50)="addx 27"
 S ^AOCD10(51)="noop"
 S ^AOCD10(52)="addx -20"
 S ^AOCD10(53)="noop"
 S ^AOCD10(54)="addx 2"
 S ^AOCD10(55)="addx 27"
 S ^AOCD10(56)="noop"
 S ^AOCD10(57)="addx -22"
 S ^AOCD10(58)="noop"
 S ^AOCD10(59)="noop"
 S ^AOCD10(60)="noop"
 S ^AOCD10(61)="noop"
 S ^AOCD10(62)="addx 3"
 S ^AOCD10(63)="addx 5"
 S ^AOCD10(64)="addx 2"
 S ^AOCD10(65)="addx -11"
 S ^AOCD10(66)="addx 16"
 S ^AOCD10(67)="addx -2"
 S ^AOCD10(68)="addx -17"
 S ^AOCD10(69)="addx 24"
 S ^AOCD10(70)="noop"
 S ^AOCD10(71)="noop"
 S ^AOCD10(72)="addx 1"
 S ^AOCD10(73)="addx -38"
 S ^AOCD10(74)="addx 15"
 S ^AOCD10(75)="addx 10"
 S ^AOCD10(76)="addx -15"
 S ^AOCD10(77)="noop"
 S ^AOCD10(78)="addx 2"
 S ^AOCD10(79)="addx 26"
 S ^AOCD10(80)="noop"
 S ^AOCD10(81)="addx -21"
 S ^AOCD10(82)="addx 19"
 S ^AOCD10(83)="addx -33"
 S ^AOCD10(84)="addx 19"
 S ^AOCD10(85)="noop"
 S ^AOCD10(86)="addx -6"
 S ^AOCD10(87)="addx 9"
 S ^AOCD10(88)="addx 3"
 S ^AOCD10(89)="addx 4"
 S ^AOCD10(90)="addx -21"
 S ^AOCD10(91)="addx 4"
 S ^AOCD10(92)="addx 20"
 S ^AOCD10(93)="noop"
 S ^AOCD10(94)="addx 3"
 S ^AOCD10(95)="addx -38"
 S ^AOCD10(96)="addx 28"
 S ^AOCD10(97)="addx -21"
 S ^AOCD10(98)="addx 9"
 S ^AOCD10(99)="addx -8"
 S ^AOCD10(100)="addx 2"
 S ^AOCD10(101)="addx 5"
 S ^AOCD10(102)="addx 2"
 S ^AOCD10(103)="addx -9"
 S ^AOCD10(104)="addx 14"
 S ^AOCD10(105)="addx -2"
 S ^AOCD10(106)="addx -5"
 S ^AOCD10(107)="addx 12"
 S ^AOCD10(108)="addx 3"
 S ^AOCD10(109)="addx -2"
 S ^AOCD10(110)="addx 2"
 S ^AOCD10(111)="addx 7"
 S ^AOCD10(112)="noop"
 S ^AOCD10(113)="noop"
 S ^AOCD10(114)="addx -27"
 S ^AOCD10(115)="addx 28"
 S ^AOCD10(116)="addx -36"
 S ^AOCD10(117)="noop"
 S ^AOCD10(118)="addx 1"
 S ^AOCD10(119)="addx 5"
 S ^AOCD10(120)="addx -1"
 S ^AOCD10(121)="noop"
 S ^AOCD10(122)="addx 6"
 S ^AOCD10(123)="addx -1"
 S ^AOCD10(124)="addx 5"
 S ^AOCD10(125)="addx 5"
 S ^AOCD10(126)="noop"
 S ^AOCD10(127)="noop"
 S ^AOCD10(128)="addx -2"
 S ^AOCD10(129)="addx 20"
 S ^AOCD10(130)="addx -10"
 S ^AOCD10(131)="addx -3"
 S ^AOCD10(132)="addx 1"
 S ^AOCD10(133)="addx 3"
 S ^AOCD10(134)="addx 2"
 S ^AOCD10(135)="addx 4"
 S ^AOCD10(136)="addx 3"
 S ^AOCD10(137)="noop"
 S ^AOCD10(138)="addx -30"
 S ^AOCD10(139)="noop"
}

}
