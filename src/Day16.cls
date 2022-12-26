Class MC2022AOC.Day16
{

ClassMethod runGame(intLive As %Integer = 1, intVerb As %Integer = 0) As %Integer
{
	I intLive=1
	{ d ..initLive() }
	ELSE 
	{ d ..initTest() }
	
	S (intCount)=0
	S aValve=0
    s aFlow=""
    s iTimeAll=30
    s iTimeRemaining=30
    S aState=""

    s astrAction=""

	// init the control array
	for intRow=1:1:^AOCD16 {
        s Data=$LFS(^AOCD16(intRow),",")
        S aValve($LI(Data,1))=$LI(Data,2,*)
        S aValve=$I(aValve)
        I $LI(Data,2)>0 
        {
            S aFlow($LI(Data,2),$LI(Data,1))=$LI(Data,3,*)
            S aState($LI(Data,1))="C"
        } ELSE {
            // no point opening it so ignore it by setting already open
            S aState($LI(Data,1))="O"
        }

	}
    
    zw aValve w !

    s sStart="AA"
    s intLoopCheck=0
Loop1
    s intLoopCheck=intLoopCheck+1 
    I intLoopCheck>10 G xit

    k aTree
    s aTree=""
    d ..getTree(.aValve,.aTree,sStart)

    zw aTree w !

    k aMaxFlow
    s aMaxFlow=""
    d ..calcFlow(.aValve,.aTree,sStart,iTimeRemaining, .aMaxFlow)

    zw aMaxFlow w !

    S mF=""
L1  S mF=$O(aMaxFlow(mF),-1) G:mF="" L1x
    s nV=$O(aMaxFlow(mF,"")) G:nV="" L1x
    I aState(nV)="C" {
        s iTimeRemaining=iTimeRemaining-aTree(sStart,nV)-1
        
        I iTimeRemaining<0 G L1x  // Out of time.
        
        s aState(nV)="O"
        s astrAction(iTimeAll-iTimeRemaining)="Open "_nV_ " flow is "_iTimeRemaining_"m @ "_($LI(aValve(nV),1))_" = "_(iTimeRemaining*($LI(aValve(nV),1)))
        s astrAction=astrAction+(iTimeRemaining*($LI(aValve(nV),1)))
        G L1x
    } 
    G L1
L1x
    I nV'="" s sStart=nV  
    w "Next Valve "_nV,!
    G Loop1
xit

    zw astrAction w !

	Q
}

ClassMethod calcFlow(ByRef aGrid, ByRef aTree, strSource, iTimeLeft, ByRef aMaxFlow)
{
    s maxFlow=iTimeLeft
    s aN=""
L1 s aN=$O(aTree(strSource,aN)) G:aN="" L1x
    s maxFlow=(iTimeLeft-aTree(strSource,aN)-1)*$LI(aGrid(aN),1)
    s:maxFlow>0 aMaxFlow(maxFlow,aN)=aN
    G L1
L1x
}

ClassMethod getTree(ByRef aGrid, ByRef aTree, strSource)
{
    S aVisited(strSource)=1
    s aUnvisited=""
    s aNode=""
L1 s aNode=$O(aGrid(aNode)) G:aNode="" L1x
    I aNode=strSource {
        // Don't need to calculate distance to itself
        S aTree(strSource,aNode)=0 
        s aVisited(strSource)=1
    } else {
        S aTree(strSource,aNode)=999999
        s aUnvisited(aNode)=1
    }
    G L1
    
L1x

    s curNode=strSource
    s legLen=1
L2
    f i=2:1:$LL(aGrid(curNode))
    {
        s nextHop=$LI(aGrid(curNode),i)
        S curDist=aTree(strSource,curNode)
        // 1 is static value of travel between nodes
        I $G(aTree(strSource,nextHop),999999) > (curDist+legLen) S aTree(strSource,nextHop)=curDist+1  
        I $D(aVisited(nextHop))=0 s aQueue((curDist+1)*-1,nextHop)=nextHop
        
    }
    s aVisited(curNode)=1
    k aUnvisited(curNode)
    s curNode=..getNext(.aGrid,.aTree,.aUnvisited,strSource) G:curNode="" L2x
    G L2
L2x
   Q
}

ClassMethod getNext(ByRef aGrid, ByRef aTree, ByRef aUnvisited, strSource) As %String
{
    s aN=""
L1 s aN=$o(aUnvisited(aN)) G:aN="" L1x
    // this will overwrite if there are duplicate lengths but it doesn't matter
    s aSort(aTree(strSource,aN))=aN
    g L1
L1x
    s retVal=""
    S iDist=$O(aSort(""),1,retVal)
    q retVal
}

ClassMethod initTest()
{
 k ^AOCD16
 
 S ^AOCD16=10
 S ^AOCD16(1)="AA,0,DD,II,BB"
 S ^AOCD16(2)="BB,13,CC,AA"
 S ^AOCD16(3)="CC,2,DD,BB"
 S ^AOCD16(4)="DD,20,CC,AA,EE"
 S ^AOCD16(5)="EE,3,FF,DD"
 S ^AOCD16(6)="FF,0,EE,GG"
 S ^AOCD16(7)="GG,0,FF,HH"
 S ^AOCD16(8)="HH,22,GG"
 S ^AOCD16(9)="II,0,AA,JJ"
 S ^AOCD16(10)="JJ,21,II"
}

ClassMethod initLive()
{
 k ^AOCD16
 
 S ^AOCD16=46
 S ^AOCD16(1)="OJ,0,EW,IG"
 S ^AOCD16(2)="BN,0,SA,AA"
 S ^AOCD16(3)="SA,5,QK,LP,ZP,BN,VH"
 S ^AOCD16(4)="RL,21,AM"
 S ^AOCD16(5)="LR,19,XZ"
 S ^AOCD16(6)="VQ,0,OW,IG"
 S ^AOCD16(7)="ZK,0,EW,WC"
 S ^AOCD16(8)="IG,16,OJ,VQ"
 S ^AOCD16(9)="WC,22,VD,ZK"
 S ^AOCD16(10)="EW,18,OJ,ZK"
 S ^AOCD16(11)="FP,8,GB"
 S ^AOCD16(12)="JF,23,VD"
 S ^AOCD16(13)="BL,0,AA,ZD"
 S ^AOCD16(14)="BZ,0,QK,JA"
 S ^AOCD16(15)="KH,0,SJ,FC"
 S ^AOCD16(16)="FU,0,FC,MH"
 S ^AOCD16(17)="ZP,0,SA,FC"
 S ^AOCD16(18)="DZ,0,AA,MH"
 S ^AOCD16(19)="RI,0,LP,MH"
 S ^AOCD16(20)="AE,0,FC,AA"
 S ^AOCD16(21)="JA,4,MM,BZ,JR,ZI,QO"
 S ^AOCD16(22)="XP,0,ZD,ZI"
 S ^AOCD16(23)="GB,0,FP,SJ"
 S ^AOCD16(24)="AM,0,ZD,RL"
 S ^AOCD16(25)="MH,3,VJ,DZ,JR,FU,RI"
 S ^AOCD16(26)="QK,0,BZ,SA"
 S ^AOCD16(27)="AA,0,DZ,CZ,BL,AE,BN"
 S ^AOCD16(28)="MJ,0,VN,VH"
 S ^AOCD16(29)="QO,0,CZ,JA"
 S ^AOCD16(30)="MM,0,FC,JA"
 S ^AOCD16(31)="VN,17,FV,MJ"
 S ^AOCD16(32)="OW,0,SJ,VQ"
 S ^AOCD16(33)="ZI,0,XP,JA"
 S ^AOCD16(34)="VJ,0,KJ,MH"
 S ^AOCD16(35)="KQ,0,XZ,KJ"
 S ^AOCD16(36)="FC,12,ZP,MM,KH,AE,FU"
 S ^AOCD16(37)="LP,0,SA,RI"
 S ^AOCD16(38)="VD,0,WC,JF"
 S ^AOCD16(39)="JR,0,MH,JA"
 S ^AOCD16(40)="VH,0,SA,MJ"
 S ^AOCD16(41)="CZ,0,AA,QO"
 S ^AOCD16(42)="SJ,15,KH,FV,GB,OW"
 S ^AOCD16(43)="FV,0,VN,SJ"
 S ^AOCD16(44)="XZ,0,LR,KQ"
 S ^AOCD16(45)="KJ,9,KQ,VJ"
 S ^AOCD16(46)="ZD,13,XP,BL,AM"
}

}
