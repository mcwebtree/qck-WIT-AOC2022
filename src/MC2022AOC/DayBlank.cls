Class MC2022AOC.DayBlank
{

// This is the stage 1 for the days games.
ClassMethod runGame(intLive As %Integer = 1, intVerb As %Integer = 0) As %Integer
{
	I intLive=1
	{ d ..initLive() }
	ELSE 
	{ d ..initTest() }
	
	S (intCount)=0
		
	// init the control array
	for intRow=1:1:numRows {

	}


	Q intCount
}

ClassMethod initTest()
{
 k ^AOCD9
 
 S ^AOCD9=5
}

ClassMethod initLive()
{
 k ^AOCD9
 
 S ^AOCD9=99
}

}
