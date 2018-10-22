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
    else number_in_month(dates, hd months) + number_in_months( dates, tl months)

(* Returns list that every int "month"  matches int "month" in the dates list of tuples *)							  
fun dates_in_month(dates:(int*int*int) list, month:int ) =
    if null dates then []
    else 
	if #2(hd dates) = month then hd dates :: dates_in_month(tl dates, month)
        else dates_in_month(tl dates, month)


(* Recursively going through the head of month, using the dates_in_month call to compare for single month and append to
-> returns list of holding the dates from the argument list of dates 
*)
fun dates_in_months(dates:(int*int*int) list, months:int list) =
    (* return *)
    if null months then []
    else dates_in_month(dates, hd months) @ dates_in_months(dates, tl months)

(* Return the nth item in the string list  *)
fun get_nth(strings: string list, n:int)=
    if n = 1 then hd strings
    else get_nth(tl strings, n-1)

fun date_to_string(date:int*int*int) = 
   
    let 
	val mths = ["January", "February", "March", "April", "May", "June", "July",
    "August", "September", "October", "November", "December"]
   
in 
   get_nth(mths, #2 date) ^ " "^ Int.toString(#3 date) ^ ",  " ^ Int.toString(#1 date)
end
   
fun number_before_reaching_sum(sum:int, ls:int list) = 
    let 
	(* helper function returns n the maximum number not exceeding the sum*)
	fun cnt(ls:int list, accu:int,n:int) =
	    if hd ls + accu >= sum then n
           else cnt(tl ls, hd ls + accu, n+1)
    in
	cnt(ls, 0,0)
end


(* Use previous function   number_before_reaching_sum to calculate the month*)
fun what_month(day:int) =
    let 
	val days = [31, 28,31,30,31,30,31,31,30,31,30,31]
    in  (* fix the bug with plus 1 *)
	1 + number_before_reaching_sum(day, days)
    end
(* 
IN: -> day 1 :int, day 2 :int
Out :-> int list

*)
fun month_range(day1:int, day2:int)=
    if day1 > day2 then []
    else what_month(day1) :: month_range(day1+1, day2)

fun oldest(dates: (int*int*int) list) =
  if null dates then NONE
  else 
    let
      val tl_ans = oldest(tl dates)
    in
      if isSome tl_ans andalso is_older(valOf tl_ans, hd dates) then tl_ans
      else SOME (hd dates)
    end
