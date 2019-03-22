sfsfs
checkstyle, and replaced checkstyle's pom.xml with the pom.xml from my fork, I got the
report origcoverage/index.html, with 82% coverage, despite the fact that the code is exactly the same
as the code in the fork, and the pom.xmls used were identical. This suggests that for some
reason, Jacoco was unable to find some tests when run on the fork, but it was able to when
run on the main branch, despite everything being identical in the repo when run. Looking at
origcoverage/index.html, everything thats not at 100% is justifiably not at 100%. grammar and grammar.javadoc
are both BNF grammar files, and are very difficult to test. gui is code for the GUI, and is also
nearly impossible to test via JUnit tests. The untested code in checks.naming is deprecated. And
finally, the untested code in checkstyle is a call to a super method in ANTLR, which would
also be very difficult to test.
3. I talked to Mike in his office hours, and he agreed that the reasons I listed in number 2
make sense. Hence, I've not added any manual tests to the test suite.
4. N/A
5. 15 error revealing tests were generated (see ErrorTest0Minimized.java). All of the first 3 'error-revealing' tests are false
positive. The first and the third are caused by inputting a null to the method visitToken, and the
second error results from inputting a new DetailAST to the same visitToken method. Though the
documentation doesn't explicitly prohibit null and new/empty DetailASTs being outputted to
visitToken, based off their usage, I believe that it would be fair to assume that visitToken
was not intended to be used with null or new/empty parameters.
6. 787 regression tests were generated (500 in RegressionTest0, 287 in RegressionTest1). Some code not tested by Randoop but tested by the original test suite (according to origcoverage/index.html) is the public static Listener class in checkstyle/src/main/java/com/puppycrawl/tools/checkstyle/ant/CheckstyleAntTask.java.
The reason Randoop wasn't able to test this class properly is that testing this class requires
knowledge of how Ant works, which Randoop certainly does not possess.  Some code tested by Randoop but not by the original test suite (according to both index.htmls) is the constructor for checkstyle/src/main/java/com/puppycrawl/tools/checkstyle/gui/MainFrame.java (Search for "MainFrame" in RegressionTest1.java). The reason the developers didn't test it is that GUI
code is incredibly hard to write tests for. 
7. Overall, my experience using Randoop was mixed. I personally spent several hours figuring out
how to use Randoop in the first place, but using it was fairly straightforward once I figured out
how it worked. Looking at the tests it generated, almost all of them had to do with "edge case"
parameters to methods (null, new/empty objects, etc.). This made Randoop work well as a sanity
check of sorts just to ensure that you did not miss an edge case when coding. However, when it
comes to testing regular, "expected" parameters, I found Randoop to be sorely lacking. I would
personally use Randoop to make sure that my code handles "edge case paramaters" correctly or
prohibits them in its documentation. In terms of improvement, I think that Randoop's documentation
could be a bit more beginner friendly, or at least include some terms newbies could google for
more understanding on how to use it. In terms of the actual tests generated, I know that this is
by no means a trivial improvement, but I'd like it if Randoop was able to give more tests on
"regular values".
8. I spent 16 hours on this assignment :(. I'd like to extend my deepest gratitude to both
Mike and Martin. Their guidance in office hours was invaluable for allowing me to finish this
assignment.

