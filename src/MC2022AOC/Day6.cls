Class MC2022AOC.Day6 [ Abstract ]
{

ClassMethod runGame2(intLive As %Integer = 1, intLen As %Integer = 4, intVerb As %Integer = 0) As %Integer
{
	I intLive=1
	{ d ..initLive() }
	ELSE 
	{ d ..initTest2() }
	
	S (intSum)=0
		
	for intRow=1:1:^AOCD6 {
		s intRet=..findPatternEnd(^AOCD6(intRow),intLen)
		w intRow_": ["_$E(^AOCD6(intRow),1,6)_"] Valid string found at "_intRet_" as "_$E(^AOCD6(intRow),intRet-intLen+1,intRet),!		
	}

	Q intRet
}

ClassMethod runGame(intLive As %Integer = 1, intLen As %Integer = 4, intVerb As %Integer = 0) As %Integer
{
	I intLive=1
	{ d ..initLive() }
	ELSE 
	{ d ..initTest() }
	
	S (intSum)=0
		
	for intRow=1:1:^AOCD6 {
		s intRet=..findPatternEnd(^AOCD6(intRow),intLen)
		w intRow_": ["_$E(^AOCD6(intRow),1,6)_"] Valid string found at "_intRet_" as "_$E(^AOCD6(intRow),intRet-intLen+1,intRet),!		
	}

	Q intRet
}

ClassMethod findPatternEnd(strString As %String, intLen As %Integer, intVerb As %Integer = 0) As %Integer
{
	s intRet="0"
	f I =1:1:$L(strString) 
	{
		S aVals(I)=$E(strString,I,I)	
	}
	
	/// Test the first string of characters 
	S fMatch=0
	F j=1:1:intLen
	{
		S aTest($E(strString,j,j))=$G(aTest($E(strString,j,j)),0)+1
	}
	I intVerb>1 zw aTest w !
	s sTest=""	
L1	S sTest=$O(aTest(sTest)) G:sTest="" L1x
	I aTest(sTest)>1 S fMatch=1
	G L1
L1x
	I fMatch=0 S intRet=intLen G xit
	k aTest
	// If the first string isn't clear
	
	f k=intLen+1:1:$L(strString)
	{
		/// Test the first string of characters 
		S fMatch=0
		s strTest=$E(strString,k-intLen+1,k)
		F j=k-intLen+1:1:k
		{
			S aTest($E(strString,j,j))=$G(aTest($E(strString,j,j)),0)+1
		}
		I intVerb>1 zw aTest w !
		s sTest=""	
L2	S sTest=$O(aTest(sTest)) G:sTest="" L2x
		I aTest(sTest)>1 S fMatch=1
		G L2
L2x
		I fMatch=0 S intRet=k G xit
		k aTest	
	}
		
xit
	Q intRet
}

ClassMethod initTest()
{
 k ^AOCD6
 
 S ^AOCD6=4
 S ^AOCD6(1)="bvwbjplbgvbhsrlpgdmjqwftvncz"
 S ^AOCD6(2)="nppdvjthqldpwncqszvftbrmjlhg"
 S ^AOCD6(3)="nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg"
 S ^AOCD6(4)="zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw"
}

ClassMethod initTest2()
{
 k ^AOCD6
 
 S ^AOCD6=4
 S ^AOCD6(1)="mjqjpqmgbljsphdztnvjfqwrcgsmlb"
 S ^AOCD6(2)="bvwbjplbgvbhsrlpgdmjqwftvncz"
 S ^AOCD6(3)="nppdvjthqldpwncqszvftbrmjlhg"
 S ^AOCD6(4)="nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg"
 S ^AOCD6(5)="zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw"
}

ClassMethod initLive()
{
 k ^AOCD6
 
 S ^AOCD6=1
 S ^AOCD6(1)="bfdbbngnvnsvshhhrvrbrtbrrhqrqgrrmmdfmmqttptltntrntrnrcrdcrrctctdtwtrwwmlltcltcllmpprvvtbbmbvbsvvqwvvscswsqqgzqqppvzppnddjwddlrdlllmwllfccdfccswwrhhndhdhfdftdfdcdcllcjjbsbgssvlvrrhfrfjfpjffvnfvfwfzftztwwrhwrhwhwddpjjmhmgmsssstzszqzfqzzprpzpnndttphtpphvvcpcjppdtdwwqgwwwnhwnnvhvsvqqtrrbsscwssgwglgwlldjdzjjbsjbsbvvpbvppvfvqvbqbzzwtwbwpbbbcffdgggpnpfptpfphfhfthfthffzrrbzbcblbmmzmhhnvvqvlvwvzvtztgzznbbcqbccwhcwcnwnhndhhgcghhlthllplvppgngrgsswfsfnfjjswstsrtrhthhqzqggdtggzvvjljddqdzzrmrjmjcmjmrrwlldttrhhfjjgbglgjlldrllppnwpnwnndrddtdqdhhpccbgcgzzswzztgzzrwwzzmtztvvrtrgttvddwvwvmwvmmdjdrdtthqhgqhggldgdfdnnzjnjffmrrnprnpnssjrrbrjjrrzvrvhvllfvlvnlvvhlhrhzrzrsrswrssjvjdjfjwwjmjvjjthhnjnmnppsccmlcclfclcbllldwldwdlwddbddmnmrmgrmmtsszgssqjsqscswwzmwmbwwvqqbtbtwwpbbwdbdbhhqmqgqddflfmfnmffbtfbbsdsffspsjpsspzszccrsrstrtjrjppcrrpqqvttsbbjtbjjpbbccmzznvvzzvnvmmwmhmvmsstlssqtssvggtbgttgvtggfhggbcgcmcrmcmhhbttdlttfrfprrvttrtggcpplccqggcwwdjjjplprrbsrbbjsjbbfhbhphtttpffdgdgjddzldzlzplpnplljttdqqlmlllhzhjhccpwcwhwwbbqtqffjpfpfpjptplltbtzbbwwvggpcpprdprpbpvvgzgczzfffzcfzccjffrmrhmrhhchvhddsvswscsnnpfppdrdcrdrgdgmdgmgllhggjwggvqvmmvrrzpprhhqfhfvffvlvnlngnffbbtccfbfhfwhhhhwcwzwjjbffvrffqrrnsnwswrsrvrjvrvprpsptspttbztzfzlfzlflcflclqlplglmlqqvlvvhccmmddqvqzvvmlllvnlnhnfnwnlndnntrrhvvgjjnpnggfqgqdqqzvvclvclvlfvlvvlzlssqffmrfmfmjjczcmmmnttnfnmfnmmmhmggjgdjjqmjjvsslszlzrrpdpcpfcpfpnpssvtsvtvllbttzzljzzhrrnsnddjgdjgjljzzvhvddmdvvdtdmmpmqmnnwcwfwbfwwsvvbpvvgvnvcvdvtvrrcppwbppcqpccwqqzmqmmzczppwbbrzrjzzcrcvrrpttrjjcdjcjfcclscstthqhfqhffdcfdfqdqldddsswbblppdmdnnjvvhwvhvjhvjhjhlhcclrrcqcgcjgcjjtbtctbcbsccfwwltlrlplpfpjphplhhgtghhrppwhhrprwpwhhdqdpdwpwwtccvncvvvrpvphpssfpplcczttltgltldlmlqmmbsszdszznpprsprsprsppsbppjddjhhnrrfsrffmlmglgmlglccddpssdpsddhhfmfsfrfsfnnlggfrgghmgmrmprmprrnvrnnbqnqddhhfwfmfwfmfpfdfzdzppsbpsbpprfrvvwvtwtltvlttrhhgvhhjttmssdggnzzvmvcczmzbzwzttvtpvpcphcctmmhshjsjbssglsglgtltslscchhhsjjpljjdtdsdpppptlpprmppwdppglgmggnddztdzddzppswwmhfbpqzffjqgmsntwsnrwqrqwgpwgrbpbjwrhbcdcvqjnwslsnwhglcsjbwjhswjvzssfqgwbbdgbwfrblfmmlmsndhtlbwzfwsspqlncspqbgbnzshbwpvrmjqjzbcbzzdgssbtqdzffjphqjvrspfrjhpspbwcjwbfhqzsdnjwqjzjtjgnbrdbwqhzffphzppvlmsmppqcfjbjbdsnbwtvthwqcfrtfrwchnmqmhnwfcjtbwqwwvlnpmwlrvzwljrljzqstzglqwbzfdftzltlcbvmmfwcjqglvznztwnvzvftpndqmngqswppsnqhdbgthrddfbcfpflpndrhmcqwvnbfztsvnjjdwqgpmvdwvdftgbtvrwbnvvrwsdfzhwbwdhlpzbcqdzhbfqtpjqcmrpvcsrmcwvgghqrclfzpfgnppzmhvdhvdfrcrnjbdcwbftcqjhhfdsnfnwjzjllzzqftzsjrqnsbpjdcswhhmwwdzmvmqcjtqnczjcvzmmqwzjhjpcczgpbmcvbwmpmvnghlrgcmrrdnmjvmvnhtpfpgwgmdfzvlbclzjzwdqqcvfhhgfzdhzpdvfmwjlzzrpdgzmttmvvcplbwfzqftcgcwcgcpgwvnmlqsplpqwfnhwvqtlwcspqdzshsqnlcpqhpcpbwdhdjsmvtbqdwbcrscqfjcrcjhbjbpzbshpbmlcthmbjfwhzfphgbfqfnfztptzvdnwrpslmdtpmzmpbsszqshwdghrbtvhwzhcmpcgfqggpgzwmhhdrlhlvnpzvwwhzqvgvhrzngttcnqgjjhnblncnqnjzlwnmwnrtvwjtnrbhthncwmzwqdbdgtwrncljddnbhmphgjzfrrgmmcwfwjwjlcrhvcdtvsrvsfhmlgmzsgjchhrfmqslmdgtdtrlbhdffddvbsdbdwlwdcmcmmpvzpdtmbthjdzlpwftptpfsggmhjfjwvbwljsfhfwtbfwmczwhbmhvzllqtcqqfbrcdqqsrcpfmnswnfzfqghcmcbqwgvzqpwvvmbpddlhgjgzvgmpljznrhqphwcztqzpnhzqdgpwwclmsgpwnwtvtsjsdmcnvmjbqglttrhbzqdbgwnbsqzmsmztndrtmlpszhzgjbbftbsdwwdrlftrbbnrsqshfhdpdrwmztcqzdjlnthnjhppwntmbqdgzpmfmfnccblsdwljqhjfgtlgvpzpjbsndmwzfwrbmdhpnmbchqlwqtbhhhqqbsfnvscjwrzvjdtvbsqwzvfhwbbjgqpzcwqjdrlfmggzmhbcrhtbqdjntbtqdvmvpqflmccfpnbmnmtqbdflsgczpbsqpfphlzqgvwbjlmsgshrhpcljzdvwvdvlqqwchtjmjgtqjhgwtnddmhphwhvwhtrhfbjjjzfgrcqngnnddctzdzlqjlbdwmjqzccwrvctrzgtzqsswggbqdnplclhtdslcvzhppcjjslnshtwjnbrwdprqhdtfqmqpgfgnqtdnnhrnzfrsqhlftpdslgmmvqhvpjqjwpwgtnmgrbhwntdjftfwtjzjtprctbtsjmqmpcbbtrjvsgqgsfjprqmsmdztbhnbgzldqfzgwqwnnccgcfclctrwqmqpgvfglgsmmpjszqnphnzcnvswpsfsrmnsnlqnpmvfdvdtfgzrdmbftdrrrbfsvzfgmnffvjpcpnndrwhtjjrrvnztlfhcvfqjgfrhtbnhmwnrmwdhzmmtvjmsqmghtbtfjwdnvdcqtqjrfhrwscjftmbgjmcsrbpdpttlmvfmnfjhnptqvggnshzqnlqqdpqqsqssppbwpblhgfrwrblpzwvqphpsgfmbpqtqqpjpgnbblzstgcjhqntgpbfwlzzctqbnbvpgwsdsdldqzhvznqcsrrghpwllshqpdlqnqgzfwrnhwsvhftzplspcbqmclplprlthvwjhdndrjblqdgwvgjlbmblbmcnbzwzdlnpnhhppvrtngvqqwsttgwlvtcqmtrvpbnvcnfqdtqrsrsmhclmtgbdwwdvhwgfcqpmprcpdhqwftcchbwvstcdqrlwtgbcfqfgzprgvpbbzlqfzbqtcrlzscnqpqwtgzbbbdvsvmhggdr"
}

}
