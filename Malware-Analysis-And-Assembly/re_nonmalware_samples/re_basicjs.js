function rottentomatoes(str) {
  return str.replace(/([A-M])|([a-m])|([N-Z])|([n-z])/g, function(match, p1, p2, p3, p4) {
    switch(match) {
      case p1:
      case p2:     
        return String.fromCharCode(match.charCodeAt(0) + 13);
      case p3:
      case p4:
        return String.fromCharCode(match.charCodeAt(0) - 13);
    }
  });
}

str1 = new String( rottentomatoes("VOZ Frphevgl K-Sbepr Gue") ); 
str2 = new String( rottentomatoes("rng Vagryyvtrapr Znyjner Erirefr Ratvarrevat Grnz"));
flag = str1.concat(str2.toString());
