Class MC2022AOC.Day15
{

ClassMethod runGame2a(intLive As %Integer = 1, intVerb As %Integer = 0) As %Integer
{

	I intLive=1
	{ d ..initLive() }
	ELSE 
	{ d ..initTest() }
	
    S sensGrid=""

    for intRow=1:1:^AOCD15 {
        s data=^AOCD15(intRow)
        // calc manhatten distance  
        S MD=$ZABS($LI(data,1)-$LI(data,3))+$ZABS($LI(data,2)-$LI(data,4))
        S $LI(data,5)=MD
        // X limits
        S $LI(data,6)=$LI(data,1)-MD
        S $LI(data,7)=$LI(data,1)+MD
        // Y limits
        S $LI(data,8)=$LI(data,2)-MD
        S $LI(data,9)=$LI(data,2)+MD
        
        w:intVerb>1 intRow_": "_$LI(data,1)_","_$LI(data,2)_" to "_$LI(data,3)_","_$LI(data,4)_" is "_MD,!
        s ^AOCD15(intRow)=data

        S sX=$LI(data,1)
        s sY=$LI(data,2)

        s perim=MD+1

        f intV=0:1:perim {
            s X1=sX-(perim-intV)
            s X2=sX+(perim-intV)
            S Y1=sY-(intV)
            S Y2=sY+(intV)
            s sensGrid(intRow,X1,Y1)=$G(sensGrid(intRow,X1,Y1),0)+1
            s sensGrid(intRow,X1,Y2)=$G(sensGrid(intRow,X1,Y2),0)+1
            s sensGrid(intRow,X2,Y1)=$G(sensGrid(intRow,X2,Y1),0)+1
            s sensGrid(intRow,X2,Y2)=$G(sensGrid(intRow,X2,Y2),0)+1
        }

        
    }

    zw sensGrid w !
}

ClassMethod runGame2(intLive As %Integer = 1, intVerb As %Integer = 0) As %Integer
{

	I intLive=1
	{ d ..initLive() }
	ELSE 
	{ d ..initTest() }
	
    for intRow=1:1:^AOCD15 {
        s data=^AOCD15(intRow)
        // calc manhatten distance  
        S MD=$ZABS($LI(data,1)-$LI(data,3))+$ZABS($LI(data,2)-$LI(data,4))
        S $LI(data,5)=MD
        // X limits
        S $LI(data,6)=$LI(data,1)-MD
        S $LI(data,7)=$LI(data,1)+MD
        // Y limits
        S $LI(data,8)=$LI(data,2)-MD
        S $LI(data,9)=$LI(data,2)+MD
        
        w:intVerb>1 intRow_": "_$LI(data,1)_","_$LI(data,2)_" to "_$LI(data,3)_","_$LI(data,4)_" is "_MD,!
        s ^AOCD15(intRow)=data
    }

    // testing limit
    //S ^AOCD15R=5

    f Y=0:1:^AOCD15R {
        w:intVerb>0 "begin "_Y _" - "_ $ZDT($H,1,3),!  
        S aLR(Y)=""
        for intRow=1:1:^AOCD15 {
            s data=^AOCD15(intRow)
            w:intVerb>1 "Start sensor "_intRow,!
            // sensor location
            s sensX=$LI(data,1)
            s sensY=$LI(data,2)

            // get limits
            s minX=$LI(data,6)
            s maxX=$LI(data,7)
            s minY=$LI(data,8)
            s maxY=$LI(data,9)

            I (minY>Y)||(maxY<Y) w:intVerb>1 "Not valid in row "_maxY_">"_Y_"<"_minY,! G SkipLoop   // Can't work in this row

            I (maxX<0)||(minX>^AOCD15R) w:intVerb>1 "Not in scope",! G SkipLoop // not in scope of validity

            // distance from sensor to target row
            S dist=$ZABS(sensY-Y)
            I dist>MD w:intVerb>1 "Not in range",! g SkipLoop // not in range of row

            s horizCover=MD-dist
            I horizCover>0
            {
                S CoverStart= $LI(data,1)-horizCover    
                S CoverEnd= $LI(data,1)+horizCover
                //S:CoverStart<0 CoverStart=0 
                //S:CoverEnd>4000000 CoverEnd=4000000 
                w:intVerb>1 "Sensor "_intRow_" covers "_CoverStart_" to "_CoverEnd,!
                S $LI(aLR(Y),*+1)=$LB(CoverStart,CoverEnd)            

            } ELSE {
                w:intVerb>1 "Sensor "_intRow_" misses",!
            }

SkipLoop
        }
        
        w:intVerb>0 !!,"Row: "_Y,!
        I intVerb>0 zw aLR(Y) w !
        while ($LL(aLR(Y))>1) {
            I intVerb>0 zw aLR(Y) w !
            S sR=$LI($LI(aLR(Y),1),1)
            S eR=$LI($LI(aLR(Y),1),2)
            w "S: "_sR_ " E: "_eR,!
            S aLRNext(Y)=""
            s thisLen=$LL(aLR(Y))
            f range=2:1:$LL(aLR(Y)) {
                S bR=$LI($LI(aLR(Y),range),1)
                S fR=$LI($LI(aLR(Y),range),2)
                // I (fR<0)||(bR>^AOCD15R) Q // not relevant
                I (bR<sR)&&(fR>=(bR-1)) w "S "_ sR_" now "_bR,! S sR=bR
                I (bR<=(eR+1))&&(fR>eR) w "E "_eR_" now "_fR,! S eR=fR
                I ((bR>eR)||(fR<sR)) S $LI(aLRNext(Y),*+1)=$LI(aLR(Y),range)
                w "S: "_sR_ " E: "_eR,!
            }
            S aLR(Y)=$LB($LB(sR,eR))_aLRNext(Y)
            s nextLen=$LL(aLR(Y))

            I (thisLen=nextLen)&&(thisLen>1) Q // Row without total overlap.
        }
        
        I intVerb>0 zw aLR(Y) w !

    }
}

ClassMethod runGame(intLive As %Integer = 1, intVerb As %Integer = 0) As %Integer
{
	S (intCount)=0
	S retRow=""

	// init the control array
	for intRow=1:1:^AOCD15 {
        s data=^AOCD15(intRow)
        // calc manhatten distance  
        S MD=$ZABS($LI(data,1)-$LI(data,3))+$ZABS($LI(data,2)-$LI(data,4))
        S $LI(data,5)=MD
        w:intVerb>1 intRow_": "_$LI(data,1)_","_$LI(data,2)_" to "_$LI(data,3)_","_$LI(data,4)_" is "_MD,!

        // distance from sensor to target row
        S dist=$ZABS($LI(data,2)-^AOCD15T)
        s horizCover=MD-dist
        I horizCover>0
        {
            S CoverStart= $LI(data,1)-horizCover    
            S CoverEnd= $LI(data,1)+horizCover
            S:CoverStart<0 CoverStart=0 
            S:CoverEnd>4000000 CoverEnd=4000000 
            f intX=CoverStart:1:CoverEnd
            {
                S retRow(intX)=1
            }
            w:intVerb>0 "Sensor "_intRow_" covers "_CoverStart_" to "_CoverEnd,!
        } ELSE {
            w:intVerb>1 "Sensor "_intRow_" misses",!
        }
        s ^AOCD15(intRow)=data
        
        // Exempt Beacon locations 
        I $LI(data,4)=^AOCD15T {
            s retRow($LI(data,3))=0
        }
	}

    S intCount=0
    S X=""
L1 S X=$O(retRow(X)) G:X="" L1x
    I (X>=0) s intCount=intCount+retRow(X)
    I X=^AOCD15R G L1x
    G L1
L1x

    //zw retRow w !

	Q intCount
}

/// Sensor X,Y  Beacon X,Y
ClassMethod initTest()
{
 k ^AOCD15
 S ^AOCD15T=10
 S ^AOCD15R=20
 S ^AOCD15=14
 S ^AOCD15(1)=$LB(2,18,-2,15)
 S ^AOCD15(2)=$LB(9,16,10,16)
 S ^AOCD15(3)=$LB(13,2,15,3)
 S ^AOCD15(4)=$LB(12,14,10,16)
 S ^AOCD15(5)=$LB(10,20,10,16)
 S ^AOCD15(6)=$LB(14,17,10,16)
 S ^AOCD15(7)=$LB(8,7,2,10)
 S ^AOCD15(8)=$LB(2,0,2,10)
 S ^AOCD15(9)=$LB(0,11,2,10)
 S ^AOCD15(10)=$LB(20,14,25,17)
 S ^AOCD15(11)=$LB(17,20,21,22)
 S ^AOCD15(12)=$LB(16,7,15,3)
 S ^AOCD15(13)=$LB(14,3,15,3)
 S ^AOCD15(14)=$LB(20,1,15,3)
}

ClassMethod initLive()
{
 k ^AOCD15

 S ^AOCD15T=2000000
 S ^AOCD15R=4000000
 S ^AOCD15=25
 S ^AOCD15(1)=$LB(3291456,3143280,3008934,2768339)
 S ^AOCD15(2)=$LB(3807352,3409566,3730410,3774311)
 S ^AOCD15(3)=$LB(1953670,1674873,2528182,2000000)
 S ^AOCD15(4)=$LB(2820269,2810878,2796608,2942369)
 S ^AOCD15(5)=$LB(3773264,3992829,3730410,3774311)
 S ^AOCD15(6)=$LB(2913793,2629579,3008934,2768339)
 S ^AOCD15(7)=$LB(1224826,2484735,2528182,2000000)
 S ^AOCD15(8)=$LB(1866102,3047750,1809319,3712572)
 S ^AOCD15(9)=$LB(3123635,118421,1453587,-207584)
 S ^AOCD15(10)=$LB(2530789,2254773,2528182,2000000)
 S ^AOCD15(11)=$LB(230755,3415342,1809319,3712572)
 S ^AOCD15(12)=$LB(846048,51145,1453587,-207584)
 S ^AOCD15(13)=$LB(3505756,3999126,3730410,3774311)
 S ^AOCD15(14)=$LB(2506301,3745758,1809319,3712572)
 S ^AOCD15(15)=$LB(1389843,957209,1453587,-207584)
 S ^AOCD15(16)=$LB(3226352,3670258,3730410,3774311)
 S ^AOCD15(17)=$LB(3902053,3680654,3730410,3774311)
 S ^AOCD15(18)=$LB(2573020,3217129,2796608,2942369)
 S ^AOCD15(19)=$LB(3976945,3871511,3730410,3774311)
 S ^AOCD15(20)=$LB(107050,209321,1453587,-207584)
 S ^AOCD15(21)=$LB(3931251,1787536,2528182,2000000)
 S ^AOCD15(22)=$LB(1637093,3976664,1809319,3712572)
 S ^AOCD15(23)=$LB(2881987,1923522,2528182,2000000)
 S ^AOCD15(24)=$LB(3059723,2540501,3008934,2768339)
 S ^AOCD15(25)=$LB(3059723,2540501,3008934,2768339)
}

}
