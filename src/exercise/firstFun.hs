doubleMe x = x + x

doubleUs x y = doubleMe x + doubleMe y

doubleSmallNum x = if x > 100
    then x
    else x * 2

doubleSmallNum' x = (if x > 100 then x else x * 2) + 1