#!/usr/bin/env gawk --lint -f
BEGIN {FS="\t"; OFS="&"}
function clink(c) {
  return "\\clnk{" c "}"
}
function clinkeach(s,    a, r, n) {
  n = split(s,a,"")
  r = ""
  for(i in a) {
    if ( a[i] == "，" || a[i] == ":") {
      r = r a[i]
    } else { 
      r = r clink(a[i])
    }
  }
  return r
}
function link(s,   t) {
  t = s
  gsub("[()]", "", t)
  return "\\lnk{" t "}{" s "}"
}
function improve(s) {
  gsub("{", "{\\em ", s)
  gsub("\\[", "\\clnk{", s)
  gsub("\\]", "}", s)
  return s
}
   {
      print clinkeach($1), clinkeach($2), clinkeach($3), $4, $5, clinkeach($6), improve($7), $8 "\\nl"
   }
