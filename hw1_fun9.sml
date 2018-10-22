(*HW1 ProgLang*)

fun is_older(a: int*int*int, b: int*int*int) =
  if #1 a = #1 b
  then
    if #2 a = #2 b then #3 a < #3 b
    else #2 a < #2 b
  else
    #1 a < #1 b

fun number_in_month(dates:(int*int*int)list, date:int)=
    if null dates then 0
    else
	if #2 (hd dates) = date then 1 + number_in_month(tl dates, date)
        else number_in_month(tl dates, date)
(* Reuse function 2 to *)
fun number_in_months(dates:(int*int*int) list, months:int list) =
    if null months then 0
    else number_in_month(dates, hd months) + number_in_months( dates,tl months)

(* Returns list that every int "month"  matches int "month" in the dates list of tuples *)							  

			 

val test1 = is_older ((1,2,3),(2,3,4)) = true

val test2 = number_in_month ([(2012,2,28),(2013,12,1)],2) = 1

val test3 = number_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = 3

