var repeatedCharacter = function(s) {
    let seen = new Set();
    for (const c of s) {
        if (seen.has(c)) {
            return c;
        }
        
        seen.add(c);
    }
    
    return " ";
};