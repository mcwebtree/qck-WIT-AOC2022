Class some.junk [ Not ProcedureBlock ]
{

ClassMethod Menue()
{
  Write #,"Welcome to OEX Contest Statistics",!
m Read !,"Select Contests, Prizes, Winners, Assign, Statistics, eXit (C,P,W,A,S,X) :",read#1,!
  Do $case($ZCVT(read,"U")
              ,"C":..Con()
              ,"P":..Prz()
              ,"W":..Win()
              ,:q)
        If "X"'=$ZCVT(m,"U") set quit=1 Goto quit     
          quit quit
   set write="just some nonnese to trigge code wuality"
   write write,!
  return write
}

ClassMethod Con(x)
{
c Read !,"Contest List, Edit, New, Delete, eXit (L,E,N,D,X) :",c#1,!
          if x Do $case($ZCVT(c,"U")
              ,"L":cl(0)
              ,"E":ce
              ,"N":cn
              ,"D":cd
              ,:cq)
 If "lendLEND"[c Goto c       
cq Quit
cl(cid) 
  Set sql="SELECT * FROM dc_rcc.Contest"
  If cid Set sql=sql_" WHERE ID="_+cid
  Set st=##class(%SQL.Statement).%New()
  Set st.%SelectMode=1  ;ODBC
  Do st.%Prepare(sql)
  Set sr=st.%Execute()
  Do sr.%Display() 
  Quit

}

ClassMethod Win(reg = "")
{
  Set rl=""
  &SQL(select List(distinct Region) into :rl from dc_rcc.Winner)
  Set rlist=$lfs(rl)_$lb("*","**")
r If '$lf(rlist,reg) {
    write !,"Winner's Region ("_rl_",*) [*] :" Read reg#2,!
    If reg="" set reg="*" 
    Goto r 
    }      

  If '$lf($lfs(rl),reg) w !,"No distinct Region ",! Quit
  Read !,"Winner's RegID :",wid,!
  If '+wid Quit
  If '##class(dc.rcc.Winner).%ExistsId(reg_"||"_+wid) Goto wd
  Do wl(wid)
  Read !,"Confirm Delete (Y,N) [N] :",cd#1,!
  If $l(cd),"yY"[cd do ##class(dc.rcc.Winner).%DeleteId(reg_"||"_+wid)
  Goto wd
we
  If '$lf($lfs(rl),reg) w !,"No distinct Region ",! Quit
  Read !,"Winner's RegID :",wid,!
  If '+wid Quit
  If '##class(dc.rcc.Winner).%ExistsId(reg_"||"_+wid) Goto we
  Do wl(wid)
  Set win=##class(dc.rcc.Winner).%OpenId(reg_"||"_+wid)
  Do we1("Change")
 Quit
}

}
