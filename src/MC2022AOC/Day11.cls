Class MC2022AOC.Day11
{

ClassMethod runGame(intLive As %Integer = 1, intRounds As %Integer = 20, intReliefFactor As %Integer = 3, intVerb As %Integer = 0) As %Integer
{
	I intLive=1
	{ d ..initLive() }
	ELSE 
	{ d ..initTest() }
	
	S (intCount)=0

    s ModDivisor=9699690
		
	// run run run
 /*
 S ^AOCD11(0)="Monk"
 S ^AOCD11(0,"SI",1)=$LB(54, 53)
 S ^AOCD11(0,"Op")=$LB("M",3)
 S ^AOCD11(0,"Test")=2
 S ^AOCD11(0,"TT")=2
 S ^AOCD11(0,"TF")=6
 */
    for intRound=1:1:intRounds { 
        for intMonkey=0:1:^AOCD11 {
            S numItems=$LL($G(^AOCD11(intMonkey,"SI",intRound),""))
            for intItem=1:1:numItems
            {
                S ^AOCD11(intMonkey,"Inspections")=$G(^AOCD11(intMonkey,"Inspections"),0)+1

                s iWL=$LI(^AOCD11(intMonkey,"SI",intRound),intItem)
                S sOp=$LI(^AOCD11(intMonkey,"Op"),1)
                S iOp=$LI(^AOCD11(intMonkey,"Op"),2)

                
                w:intVerb>1 "M"_intMonkey_" R"_intRound_" I"_intItem_" WL"_iWL,!

                // Op up on inspect
                I sOp="M" 
                { w:intVerb>1 iWL_"M"_iOp  S iWL=(iWL*iOp) w:intVerb>1 "="_iWL,! }
                ELSEIF sOp="A" 
                { w:intVerb>1 iWL_"A"_iOp  S iWL=(iWL+iOp)  w:intVerb>1 "="_iWL,! }
                ELSEIF sOp="Sq"
                {   
                    w:intVerb>1 iWL_"Sq"_iWL    
                    S iWL=(iWL*iWL) 
                    w:intVerb>1 "="_iWL,! 
                    }

                // Op down post inspect
                S iWL=(iWL\intReliefFactor)
                w:intVerb>1 "New WL "_ iWL,!

                S iWL=(iWL#ModDivisor)
                
                // Test routing
                S iTest=^AOCD11(intMonkey,"Test")
                I iWL#iTest=0
                { 
                    w:intVerb>1 "Throw to "_^AOCD11(intMonkey,"TT"),! 
                    I ^AOCD11(intMonkey,"TT")>intMonkey
                    {
                        S $LI(^AOCD11(^AOCD11(intMonkey,"TT"),"SI",intRound),*+1)=iWL
                    } ELSE {
                        S $LI(^AOCD11(^AOCD11(intMonkey,"TT"),"SI",intRound+1),*+1)=iWL
                    }
                 } 
                ELSE 
                { 
                    w:intVerb>1 "Throw to "_^AOCD11(intMonkey,"TF"),! 
                    I ^AOCD11(intMonkey,"TF")>intMonkey
                    {
                        S $LI(^AOCD11(^AOCD11(intMonkey,"TF"),"SI",intRound),*+1)=iWL
                    } ELSE {
                        S $LI(^AOCD11(^AOCD11(intMonkey,"TF"),"SI",intRound+1),*+1)=iWL
                    }
                }


            }            
        }

        
        for intMonkey=0:1:^AOCD11 {
            W:intVerb>0 "R"_intRound_" M "_intMonkey_" Q "_ $LTS($G(^AOCD11(intMonkey,"SI",intRound+1),""),","),!
        }
    }

    S (max1,max2)=0
    for intMonkey=0:1:^AOCD11 {
        W "Monkey "_intMonkey_" inspected "_ ^AOCD11(intMonkey,"Inspections"),!
        S aRet(^AOCD11(intMonkey,"Inspections"))=intMonkey
        I ^AOCD11(intMonkey,"Inspections")>max1
        { 
            S max2=max1
            s max1=^AOCD11(intMonkey,"Inspections")
        } ELSEIF ^AOCD11(intMonkey,"Inspections")>max2
        { 
            S max2=^AOCD11(intMonkey,"Inspections")
        }
    }
    W "Max1: "_max1_" Max2: "_max2_" * "_(max1*max2),!
	Q intCount
}

ClassMethod initTest()
{
 k ^AOCD11
 
 S ^AOCD11=3
 S ^AOCD11(0)="Monk"
 S ^AOCD11(0,"SI",1)=$LB(79, 98)
 S ^AOCD11(0,"Op")=$LB("M",19)
 S ^AOCD11(0,"Test")=23
 S ^AOCD11(0,"TT")=2
 S ^AOCD11(0,"TF")=3

 S ^AOCD11(1)="Monk"
 S ^AOCD11(1,"SI",1)=$LB(54, 65, 75, 74)
 S ^AOCD11(1,"Op")=$LB("A",6)
 S ^AOCD11(1,"Test")=19
 S ^AOCD11(1,"TT")=2
 S ^AOCD11(1,"TF")=0

 S ^AOCD11(2)="Monk"
 S ^AOCD11(2,"SI",1)=$LB(79, 60, 97)
 S ^AOCD11(2,"Op")=$LB("Sq",0)
 S ^AOCD11(2,"Test")=13
 S ^AOCD11(2,"TT")=1
 S ^AOCD11(2,"TF")=3

 S ^AOCD11(3)="Monk"
 S ^AOCD11(3,"SI",1)=$LB(74)
 S ^AOCD11(3,"Op")=$LB("A",3)
 S ^AOCD11(3,"Test")=17
 S ^AOCD11(3,"TT")=0
 S ^AOCD11(3,"TF")=1
}

ClassMethod initLive()
{
 k ^AOCD11
 
 S ^AOCD11=7

 S ^AOCD11(0)="Monk"
 S ^AOCD11(0,"SI",1)=$LB(54, 53)
 S ^AOCD11(0,"Op")=$LB("M",3)
 S ^AOCD11(0,"Test")=2
 S ^AOCD11(0,"TT")=2
 S ^AOCD11(0,"TF")=6

 S ^AOCD11(1)="Monk"
 S ^AOCD11(1,"SI",1)=$LB(95, 88, 75, 81, 91, 67, 65, 84)
 S ^AOCD11(1,"Op")=$LB("M",11)
 S ^AOCD11(1,"Test")=7
 S ^AOCD11(1,"TT")=3
 S ^AOCD11(1,"TF")=4

 S ^AOCD11(2)="Monk"
 S ^AOCD11(2,"SI",1)=$LB(76, 81, 50, 93, 96, 81, 83)
 S ^AOCD11(2,"Op")=$LB("A",6)
 S ^AOCD11(2,"Test")=3
 S ^AOCD11(2,"TT")=5
 S ^AOCD11(2,"TF")=1

 S ^AOCD11(3)="Monk"
 S ^AOCD11(3,"SI",1)=$LB(83, 85, 85, 63)
 S ^AOCD11(3,"Op")=$LB("A",4)
 S ^AOCD11(3,"Test")=11
 S ^AOCD11(3,"TT")=7
 S ^AOCD11(3,"TF")=4

 S ^AOCD11(4)="Monk"
 S ^AOCD11(4,"SI",1)=$LB(85, 52, 64)
 S ^AOCD11(4,"Op")=$LB("A",8)
 S ^AOCD11(4,"Test")=17
 S ^AOCD11(4,"TT")=0
 S ^AOCD11(4,"TF")=7

 S ^AOCD11(5)="Monk"
 S ^AOCD11(5,"SI",1)=$LB(57)
 S ^AOCD11(5,"Op")=$LB("A",2)
 S ^AOCD11(5,"Test")=5
 S ^AOCD11(5,"TT")=1
 S ^AOCD11(5,"TF")=3

 S ^AOCD11(6)="Monk"
 S ^AOCD11(6,"SI",1)=$LB(60, 95, 76, 66, 91)
 S ^AOCD11(6,"Op")=$LB("Sq",0)
 S ^AOCD11(6,"Test")=13
 S ^AOCD11(6,"TT")=2
 S ^AOCD11(6,"TF")=5

 S ^AOCD11(7)="Monk"
 S ^AOCD11(7,"SI",1)=$LB(65, 84, 76, 72, 79, 65)
 S ^AOCD11(7,"Op")=$LB("A",5)
 S ^AOCD11(7,"Test")=19
 S ^AOCD11(7,"TT")=6
 S ^AOCD11(7,"TF")=0
}

}
