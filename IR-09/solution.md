# Solution

## Questions

### 1. Return all documents that mention `aliens` OR `swords`
**Command:**
```bash
grep -l -e "aliens" -e "swords" docs/*
```
**Result:**
```
docs/doc1.txt
docs/doc2.txt
docs/doc3.txt
docs/doc4.txt
```

### 2. Return only documents that mention both
**Command:**
```bash
grep -l "aliens" docs/* | xargs grep -l "swords"
```
**Result:**
```
docs/doc1.txt
docs/doc2.txt
docs/doc3.txt
docs/doc4.txt
```

### 3. Return documents that mention aliens but not wizards
**Command:**
```bash
grep -l "aliens" docs/* | xargs grep -L "wizards"
```
**Result:**
```
docs/doc1.txt
docs/doc2.txt
docs/doc3.txt
docs/doc4.txt
```

### 4. Return documents for: `(aliens AND swords) NOT wizards`
**Command:**
```bash
grep -l "aliens" docs/* | xargs grep -l "swords" | xargs grep -L "wizards"
```
**Result:**
```
docs/doc1.txt
docs/doc2.txt
docs/doc3.txt
docs/doc4.txt
```

### 5. Documents that contain (aliens OR robots) AND swords
**Command:**
```bash
grep -l -e "aliens" -e "robots" docs/* | xargs grep -l "swords"
```
**Result:**
```
docs/doc1.txt
docs/doc2.txt
docs/doc3.txt
docs/doc4.txt
```

### 6. Return docs for: `(aliens OR robots) AND (swords OR wizards)`
**Command:**
```bash
grep -l -e "aliens" -e "robots" docs/* | xargs grep -l -e "swords" -e "wizards"
```
**Result:**
```
docs/doc1.txt
docs/doc2.txt
docs/doc3.txt
docs/doc4.txt
```

### 7. Return docs for: `(aliens AND swords) AND NOT (wizards OR robots)`
**Command:**
```bash
grep -l "aliens" docs/* | xargs grep -l "swords" | xargs grep -L -e "wizards" -e "robots"
```
**Result:**
```
docs/doc1.txt
docs/doc2.txt
docs/doc4.txt
```

### 8. Make your query case-insensitive and prove it changes results
**Task:** Change one “aliens” to “Aliens” in `doc1.txt` and compare case-sensitive vs case-insensitive search.

**Commands to Edit and Test:**
```bash
# 1. Verify original match
grep -l "aliens" docs/doc1.txt
```
```
docs/doc1.txt
```
```
# 2. Edit the file (Change first 'aliens' to 'Aliens')
while read -r line; do printf "%s\n" "${line/aliens/Aliens}"; done < docs/doc1.txt > docs/doc1.tmp && cat docs/doc1.tmp > docs/doc1.txt
```
```
# 3. Verify case-sensitive match fails (Returns nothing)
grep -l "aliens" docs/doc1.txt
```
```
# 4. Verify case-insensitive match succeeds (Returns doc1.txt)
grep -il "aliens" docs/doc1.txt
```

### 9. Write a query that matches alien but not aliens
**Command:**
```bash
grep -w "alien" docs/*
```

**Result:**
```
docs/doc1.txt:The alien warriors arrived with shining swords.
docs/doc1.txt:The space battlefield was filled with alien ships and steel swords.
docs/doc3.txt:Advanced robots were used to scan alien planets.
```
