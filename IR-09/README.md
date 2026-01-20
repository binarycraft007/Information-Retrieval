# Classwork:

In this Classwork, you are going to turn a simple Linux command ``grep`` into a tiny search engine. 

You have a folder ``docs`` containing ``doc1.txt`` ... `doc4.txt` (the aliens/swords/wizards/robots collection). Run everything from the parent folder. 

## Rules
- You may use `grep`, `pipes |`, `xargs`, `sort`, `uniq`, `wc`, `cat`, `tee`, `printf`, `while read`.
> [!IMPORTANT]
> No Python, no `ripgrep`, no `awk/sed`. 
- Every answer must include:
  - the command(s) you used
  - the resulting document IDs (D1..D4 or filenames)
  - a 1–2 sentence explanation of the Boolean logic
  - the incidence matrix (terms × documents) that justifies your answer

### Questions:
1. Return all documents that mention `aliens` OR `swords`
2. Return only documents that mention both
3. Return documents that mention aliens but not wizards
4. Return documents for: `(aliens AND swords) NOT wizards`
5. Documents that contain (aliens OR robots) AND swords
6. Return docs for: `(aliens OR robots) AND (swords OR wizards)`
7. Return docs for: `(aliens AND swords) AND NOT (wizards OR robots)` 
8. Make your query case-insensitive and prove it changes results by editing exactly one document line (change one “aliens” to “Aliens” in one file). Run the same query before/after and explain.
9. Write a query that matches alien but not aliens. Explain why `grep "alien"` is wrong and how you fixed it.